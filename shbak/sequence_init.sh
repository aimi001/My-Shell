NUM=0
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    #修改表名，添加后缀
    SEQ=1
    #cat /root/dep_sequence.sql | while read line
    #cat /root/loan_sequence.sql | while read line
    cat /root/ae_sequence.sql | while read line
    do
        #insert
        #echo "insert into dbp_sequence_${NO}(id,\`name\`,\`value\`,\`min_value\`,\`max_value\`,\`step\`) \
        #      values(${SEQ},'$line',1,1,99999999,10000);" >> sequence_${NO}.sql
        #SEQ=`expr $SEQ + 1`
        #delete
        echo "delete from dbp_sequence_${NO} where name='${line}';" >> sequence_${NO}.sql
        #update
        #echo "update dbp_sequence_${NO} set value=1 where name='${line}';" >> sequence_${NO}.sql
    done
    sed -i 's/^M//g' sequence_${NO}.sql

    mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 -Dcb_ae_${NO} < sequence_${NO}.sql
    #mysql -h 10.245.1.165 -udep -pdep -P3306 -Dcb_dep_${NO} < sequence_${NO}.sql
    #mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 -Dcb_loan_${NO} < sequence_${NO}.sql
    rm -rf sequence_${NO}.sql

    NUM=`expr $NUM + 1`
done
