IP=10.245.1.223
DBUSER=cb_loan
DBPASS=cb_loan
DBNAME=cb_loan

NUM=0
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$NO < sqlbak/init_$NO.sql
    if [ $? -ne 0 ];then
        echo "load init_$NO.sql error"
        exit 1
    fi

    echo "------------${DBNAME}_${NO} successed!------------"

    NUM=`expr $NUM + 1`
done

