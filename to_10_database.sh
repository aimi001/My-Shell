#临时上线脚本生成
#参数1：数据库名  参数2：文件全路径
#输出文件: /home/ftpuser/sbin/tmp.sql
#注意：参数1的数据库名为不带数字后缀的库名
#使用示例： sh /home/ftpuser/sbin/to_10_database.sh cb_loan /home/ftpuser/tmp.sql

if [ $# -ne 2 ];then
    echo "输入参数有误，请重新输入!"
    exit 1
fi

DBNAME=$1
FILE=$2

rm -rf ~/sbin/tmp.sql

NUM=0
for((j=0;j<10;j++))
do
    echo "use ${DBNAME}_$j;" >> ~/sbin/tmp.sql
    
    for((i=0;i<10;i++))
    do
        if [ $NUM -lt 10 ];then
            NO=`echo "0$NUM"`
        else
            NO=$NUM
        fi

        sed -i 's/_##/_'$NO'/g' $FILE
        cat $FILE >> ~/sbin/tmp.sql
        sed -i 's/_'$NO'/_##/g' $FILE

        NUM=`expr $NUM + 1`
    done

    echo "-------------------------${DBNAME}_$j successed!--------------------------"
done

