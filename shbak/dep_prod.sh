IP=10.2.8.95
DBUSER=cb_dep_app@dep_tenant
DBPASS=OeaIi87b
DBNAME=cb_dep
FILE=/home/ftpuser/tmp.sql

NUM=0
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    #需要将最新数据同步到原单库单表环境，方便程序根据单库数据库生成最近表结构bean
    #if [ $NUM -eq 0 ];then
    #    mysql -h 10.245.1.165 -udep -pdep -P3306 -Dob_dep < $FILE
    #    if [ $? -ne 0 ];then
    #        #此时$FILE中drop table语句必须包含if exists语句，否则会报错
    #        echo "load $FILE error"
    #        exit 1
    #    fi
    #fi

    #将脚本中的关键字段替换为小写
    sed -i 's/TABLE/table/g' $FILE
    sed -i 's/FROM/from/g' $FILE
    sed -i 's/INTO/into/g' $FILE
    sed -i 's/UPDATE/update/g' $FILE
    #替换if exists
    sed -i 's/if exists//Ig' $FILE

    cat $FILE | while read line
    do
        SQL=`echo "$line" | egrep -i -w '(table|from|into|update)'`
        if [ -z "$SQL" ];then
            #不包含表名的语句直接输出
            echo $line >> dep_create_$NO.sql
        else
            #处理包含表名的行 
            echo "$line" | grep -i -w table > TMP
            #如果文件存在且文件大小大于0,则当前行包含(drop table|create table|truncate table)语句
            if [ -s TMP ];then
                TABLENAME=`echo "$line" | awk -F "table" '{print $2}' | awk -F "[(;]" '{print $1}' | awk '{print $1}'`
                echo "$line" | sed 's/'${TABLENAME}'/'${TABLENAME}'_'${NO}'/g' >> dep_create_$NO.sql
                
                FLAG=`echo "$line" | grep -i -w drop | wc -l`
                if [ $FLAG -gt 0 ];then
                    #drop操作需要先备份原表数据
                    mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 ${DBNAME}_$NO \
                                                                      ${TABLENAME}_$NO > ${TABLENAME}_${NO}_init_bak.sql
                    #必须注释，不能放开
                    #if [ $? -ne 0 ];then
                    #    echo "mysqldump error"
                    #    exit 1
                    #fi
                fi
            else
                echo "$line" | grep -i -w from > TMP
                #如果文件存在且文件大小大于0,则当前行包含(select from|delete from)语句
                if [ -s TMP ];then
                    TABLENAME=`echo "$line" | awk -F "from" '{print $2}' | awk -F "[; ]" '{print $2}'`
                    echo "$line" | sed 's/'${TABLENAME}'/'${TABLENAME}'_'${NO}'/g' >> dep_create_$NO.sql
                else
                    echo "$line" | grep -i -w into > TMP
                    #如果文件存在且文件大小大于0,则当前行包含(insert into)语句
                    if [ -s TMP ];then
                        TABLENAME=`echo "$line" | awk -F "into" '{print $2}' | awk -F "[( ]" '{print $2}'`
                        echo "$line" | sed 's/'${TABLENAME}'/'${TABLENAME}'_'${NO}'/g' >> dep_create_$NO.sql
                    else
                        echo "$line" | grep -i -w update > TMP
                        #如果文件存在且文件大小大于0,则当前行包含(update)语句
                        if [ -s TMP ];then
                            TABLENAME=`echo "$line" | awk -F "update" '{print $2}' | awk '{print $1}'`
                            echo "$line" | sed 's/'${TABLENAME}'/'${TABLENAME}'_'${NO}'/g' >> dep_create_$NO.sql
                        fi
                    fi    
                fi
            fi
        fi
    done
    sed -i 's/^M//g' dep_create_$NO.sql

    #将if exists增加到脚本中，以免报错
    sed -i 's/drop table/drop table if exists/Ig' dep_create_$NO.sql

    #执行替换表名后的新脚本
    mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$NO < dep_create_$NO.sql
    if [ $? -ne 0 ];then
        echo "load dep_create_$NO.sql error"
        exit 1
    fi

    #如果之前备份过数据，重建表后需要将数据还原
    FLAG_DROP=`grep -i -w drop dep_create_$NO.sql | wc -l`
    FLAG_CREATE=`grep -i -w create dep_create_$NO.sql | wc -l`
    if [ $FLAG_DROP -gt 0 ] && [ $FLAG_CREATE -gt 0 ];then
        cat *_${NO}_init_bak.sql > all_${NO}_init_bak.sql
        grep -i insert all_${NO}_init_bak.sql > init_tmp.sql
        mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$NO < init_tmp.sql
        if [ $? -ne 0 ];then
            echo "load init_tmp.sql error"
            exit 1
        fi
        #mv all_${NO}_init_bak.sql sqlbak
        rm -rf *_${NO}_init_bak.sql
        rm -rf init_tmp.sql
    elif [ $FLAG_DROP -gt 0 ];then
        cat *_${NO}_init_bak.sql > all_${NO}_init_bak.sql
        #mv all_${NO}_init_bak.sql sqlbak
        rm -rf *_${NO}_init_bak.sql
    fi

    #mv dep_create_$NO.sql sqlbak
    rm -rf dep_create_$NO.sql

    echo "------------${DBNAME}_${NO} successed!------------"

    NUM=`expr $NUM + 1`
done

rm -rf TMP
