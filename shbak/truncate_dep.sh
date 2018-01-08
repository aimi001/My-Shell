IP=10.248.1.93
DBUSER=root
DBPASS=itfin1020
DBNAME=cb_dep
FILE=/home/ftpuser/TABLELIST_DEP
#DEV
#贷款
#mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 -Dcb_loan <<!
#资产交换
#mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 -Dcb_ae <<!
#存款
#mysql -h 10.245.1.165 -udep -pdep -P3306 -Dcb_dep <<!
#SIT
#贷款
#mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 -Dsit_cb_loan <<!
#资产交换
#mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 -Dsit_cb_ae <<!
#存款
#mysql -h 10.245.1.165 -udep -pdep -P3306 -Dsit_cb_dep <<!
#UAT
#贷款
#mysql -h 10.247.1.23 -uroot -pITfin1020 -P3306 -Dcb_loan <<!
#资产交换
#mysql -h 10.247.1.12 -uroot -pITfin1020 -P3306 -Dcb_ae <<!
#存款
#mysql -h 10.247.1.20 -uroot -pITfin1020 -P3306 -Dcb_dep <<!
#batch
#贷款
#mysql -h 10.248.1.96 -uroot -pitfin1020 -P3306 -Dcb_loan <<!
#资产交换
#mysql -h 10.248.1.88 -uroot -pitfin1020 -P3306 -Dcb_ae <<!
#存款
#mysql -h 10.248.1.93 -uroot -pitfin1020 -P3306 -Dcb_dep <<!
#prod
#贷款
#mysql -h 10.2.8.95 -ucb_loan_app@loan_tenant -pth8fIVo9 -P3306 -Dcb_loan <<!
#资产交换
#mysql -h 10.2.8.95 -ucb_ae_app@ae_tenant -pAvoIiw40 -P3306 -Dcb_ae <<!
#存款
#mysql -h 10.2.8.95 -ucb_dep_app@dep_tenant -pOeaIi87b -P3306 -Dcb_dep <<!

NUM=0
while [ $NUM -lt 100 ];do
    if [ $NUM -lt 10 ];then
        NO=`echo "0$NUM"`
    else
        NO=$NUM
    fi

    sed -i 's/_##/_'$NO'/g' $FILE
    mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME}_$NO < $FILE
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
    mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME} < $FILE
    mv $FILE.bak $FILE
fi

