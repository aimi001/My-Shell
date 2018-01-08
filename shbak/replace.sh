FILE=/root/tmp.sql
grep -i -n decimal $FILE | grep ",0" | while read line
do
   NO=`echo "$line" | awk -F ":" '{print $1}'`
   FIELD=`echo $line | awk '{print $3}'`
   #echo "$NO $FIELD"
   sed -i ''$NO's/'$FIELD'/bigint/g' $FILE
done
