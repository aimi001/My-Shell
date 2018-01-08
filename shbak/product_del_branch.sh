FILE=/home/ftpuser/sbin/del_list.txt
cat $FILE | while read line
do
    BRANCH=`echo "$line" | awk '{print $1}'`
    MJ=`echo "$line" | awk '{print $2}'`
    MI=`echo "$line" | awk '{print $3}'`
    echo "$BRANCH $MJ $MI"
    sh /root/sbin/product_del.sh cb_supp root itfin1020 $BRANCH $MJ $MI
done
