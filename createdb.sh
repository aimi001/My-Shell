DBNAME=cb_dep
NUM=0
while [ $NUM -lt 10 ];do
    NO=$NUM

#贷款
#mysql -h 10.247.1.23 -uroot -pITfin1020 -P3306 <<!
#资产交换
#mysql -h 10.247.1.12 -uroot -pITfin1020 -P3306 <<!
#存款
mysql -h 10.247.1.20 -uroot -pITfin1020 -P3306 <<!
    drop database if exists ${DBNAME}_${NO} ;
    create database ${DBNAME}_${NO} ;
!

    NUM=`expr $NUM + 1`
done
