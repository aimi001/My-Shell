NUM=0
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    #修改表名，添加后缀
    cat /root/dbp_sequence.sql | while read line
    do
        SQL=`echo $line | egrep -i '(create table|drop table)'`
        if [ -z "$SQL" ];then
            echo $line >> sequence_$NO.sql
        else
            SQL1=`echo $line | grep -i "create table"`
            if [ -z "$SQL1" ];then
                AA=`echo $line | awk -F ";" '{printf "%s",$1}'`
                echo "${AA}_$NO;" >> sequence_$NO.sql
            else
                BB=`echo $line | awk -F "(" '{printf "%s",$1}'`
                echo "${BB}_$NO(" >> sequence_$NO.sql
            fi
        fi
    done
    sed -i 's/^M//g' sequence_$NO.sql

    mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 -Dcb_ae_$NO < sequence_$NO.sql
    mysql -h 10.245.1.165 -udep -pdep -P3306 -Dcb_dep_$NO < sequence_$NO.sql
    mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 -Dcb_loan_$NO < sequence_$NO.sql
    rm -rf sequence_$NO.sql

    NUM=`expr $NUM + 1`
done
