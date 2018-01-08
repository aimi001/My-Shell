FILE=/root/sbin/select.txt
IP=10.245.1.224
DBUSER=cb_supp
DBPASS=cb_supp
DBNAME=sit_cb_supp

#删除原有脚本
rm -rf /root/sbin/select.sql

sed -i 's/FROM/from/Ig' $FILE
sed -i 's/WHERE/where/Ig' $FILE

cat $FILE | while read line
do
    echo "$line" > TMP
    if [ ! -s TMP ];then
        continue
    fi
    #截取表名
    TABNAME=`echo "$line" | awk -F "from" '{print $2}' | awk '{print $1}'  | awk -F ";" '{print $1}'`
    #截取查询条件
    WHERE_TMP=`echo "$line" | awk -F "$TABNAME" '{print $2}'`
    WHERE=`echo "$WHERE_TMP" | awk -F "where" '{print $2}'`
    
#    echo "TABNAME=$TABNAME"
#    echo "WHERE_TMP=${WHERE_TMP}"
#    echo "WHERE=$WHERE"
    if [ -z "$WHERE" ];then
#        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "1=1 ${WHERE_TMP}" | grep -i insert \
#        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "1=1 ${WHERE_TMP}" | grep -v -i insert \
        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "1=1 ${WHERE_TMP}" \
        2>/dev/null 1>>/root/sbin/select.sql
    else
#        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "$WHERE" | grep -i insert \
#        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "$WHERE" | grep -v -i insert \
        mysqldump -h $IP --compact --extended-insert=false -c -u$DBUSER -p$DBPASS -P3306 $DBNAME $TABNAME --where "$WHERE" \
        2>/dev/null 1>>/root/sbin/select.sql
    fi
done
rm -rf /root/sbin/TMP
echo "success!"
