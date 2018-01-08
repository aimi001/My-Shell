#batch
IP=10.248.1.95
DBUSER=root
DBPASS=itfin1020
DBNAME=cb_ia

#dev
#IP=10.245.1.224
#DBUSER=root
#DBPASS=itfin1020
#DBNAME=cb_ia

#sit
#IP=10.245.1.224
#DBUSER=root
#DBPASS=itfin1020
#DBNAME=sit_cb_ia

#prod
#IP=10.2.8.95
#DBUSER=cb_ia_app@ia_tenant
#DBPASS=zh2mT3eN
#DBNAME=cb_ia_global

#uat
#IP=10.247.1.22
#DBUSER=root
#DBPASS=ITfin1020
#DBNAME=cb_ia

mysql -h $IP -u$DBUSER -p$DBPASS -P3306 -D${DBNAME} <<!
UPDATE cb_ia_acctbal SET preeffdate = "2017-01-01" , preamt = 0, effdate = "2017-01-01", amt = 0;
truncate table  cb_ia_buffrtxn;
truncate table  cb_ia_chanrtxn;
truncate table cb_ia_disttran;
truncate table cb_ia_disttranamt;
truncate table cb_ia_disttranrtxn;
truncate table cb_ia_fundrpt;
truncate table cb_ia_itlhupreg;
truncate table cb_ia_itlhuprelreg;
truncate table cb_ia_itlrtxn;
truncate table  cb_ia_loanclearcollect;
truncate table cb_ia_loanclearcollectmain;
truncate table cb_ia_rtxnbal;
truncate table cb_ia_rtxnfundtyp;
!
echo "-------------------------${DBNAME} succed!--------------------------"
