if [ $# -ne 5 ];then
    echo "输入参数有误，请重新输入!"
    exit 1
fi

IP=$1
DBUSER=$2
DBPASS=$3
DBNAME=$4
FILE=$5

NUM=0
TAB_NUM=0
while [ $NUM -lt 10 ];do
    DB_NO=$NUM

    echo "DB_NO=$DB_NO"
    
    for((i=0;i<10;i++))
    do
        if [ $TAB_NUM -lt 10 ];then
            TAB_NO=`echo "0$TAB_NUM"`
        else
            TAB_NO=$TAB_NUM
        fi
   
        echo "TAB_NO=$TAB_NO"

        sed -i 's/_##/_'$TAB_NO'/g' $FILE
        mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$DB_NO < $FILE
        if [ $? -ne 0 ];then
            echo "-------------------------${DBNAME}_$DB_NO error!--------------------------"
            sed -i 's/_'$TAB_NO'/_##/g' $FILE
            exit 1
        fi
        sed -i 's/_'$TAB_NO'/_##/g' $FILE
        TAB_NUM=`expr $TAB_NUM + 1`
    done
    echo "-------------------------${DBNAME}_$DB_NO succed!--------------------------"
    NUM=`expr $NUM + 1`
done

