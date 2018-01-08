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
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    sed -i 's/_##/_'$NO'/g' $FILE
    mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$NO < $FILE
    if [ $? -ne 0 ];then
        echo "-------------------------${DBNAME}_$NO error!--------------------------"
        sed -i 's/_'$NO'/_##/g' $FILE
        exit 1
    fi
    sed -i 's/_'$NO'/_##/g' $FILE
    echo "-------------------------${DBNAME}_$NO succed!--------------------------"
    NUM=`expr $NUM + 1`
done

#将变动打到版本库
if [ $IP == "10.245.1.223" ] && [ $DBNAME == "cb_loan" ];then
    cp $FILE $FILE.bak
    sed -i 's/_##//g' $FILE
    mysql -h 10.245.1.165 -uloan -ploan -P3306 -Dob_loan < $FILE
    mv $FILE.bak $FILE
fi

if [ $IP == "10.245.1.226" ] && [ $DBNAME == "cb_ae" ];then
    cp $FILE $FILE.bak
    sed -i 's/_##//g' $FILE
    mysql -h 10.245.1.165 -u$DBUSER -p$DBPASS -P3306 -D$DBNAME < $FILE
    mv $FILE.bak $FILE
fi

if [ $IP == "10.245.1.165" ] && [ $DBNAME == "cb_dep" ];then
    cp $FILE $FILE.bak
    sed -i 's/_##//g' $FILE
    mysql -h $IP -udep -pdep -P3306 -Dob_dep < $FILE
    mv $FILE.bak $FILE
fi

