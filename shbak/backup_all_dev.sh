source /home/ftpuser/.bash_profile
#存款系统
IP_DEP=10.245.1.165
DBUSER_DEP=dep
DBPASS_DEP=dep
DBNAME_DEP=cb_dep
#贷款系统
IP_LOAN=10.245.1.223
DBUSER_LOAN=cb_loan
DBPASS_LOAN=cb_loan
DBNAME_LOAN=cb_loan
#核算系统
IP_GL=10.245.1.225
DBUSER_GL=cb_gl
DBPASS_GL=cb_gl
DBNAME_GL=cb_gl
#内部帐系统
IP_IA=10.245.1.224
DBUSER_IA=cb_ia
DBPASS_IA=cb_ia
DBNAME_IA=cb_ia
#支持系统
IP_SUPP=10.245.1.224
DBUSER_SUPP=cb_supp
DBPASS_SUPP=cb_supp
DBNAME_SUPP=cb_supp
#后管系统
IP_CBMG=10.245.1.232
DBUSER_CBMG=co_cbmg
DBPASS_CBMG=co_cbmg
DBNAME_CBMG=co_cbmg
#批量系统
IP_BATCH=10.245.1.227
DBUSER_BATCH=batch
DBPASS_BATCH=batch
DBNAME1_BATCH=cb_batch
DBNAME2_BATCH=cb_dep_batch
DBNAME3_BATCH=cb_loan_batch
DBNAME4_BATCH=cb_gl_batch
DBNAME5_BATCH=cb_ia_batch
#资产交换
IP_AE=10.245.1.226
DBUSER_AE=cb_ae
DBPASS_AE=cb_ae
DBNAME_AE=cb_ae
#客户中心
IP_COL=10.245.1.164
DBUSER_COL=cs_col
DBPASS_COL=cs_col
DBNAME_COL=cs_col


BAKDATE=`date +%Y%m%d`

func_dep()
{
#存款系统备份
BAKDIR_DEP=/home/ftpuser/sbin/sqlbak/$DBUSER_DEP$BAKDATE
if [ ! -d $BAKDIR_DEP ];then
    mkdir $BAKDIR_DEP
fi

echo "----------------------存款系统备份开始----------------------"

NUM_DEP=0
while [ $NUM_DEP -lt 100 ];do
    if [ $NUM_DEP -lt 10 ];then
        NO_DEP=`echo "0$NUM_DEP"`
    else
        NO_DEP=$NUM_DEP
    fi

mysql -h $IP_DEP -u$DBUSER_DEP -p$DBPASS_DEP -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_DEP_$NO_DEP
    select table_name from information_schema.tables where table_schema='${DBNAME_DEP}_$NO_DEP' order by table_name;
!
     
    sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_DEP_$NO_DEP

    cat /home/ftpuser/sbin/TABLELIST_DEP_$NO_DEP | while read TABLENAME_DEP
    do
        echo $TABLENAME_DEP
        mysqldump -h $IP_DEP --compact --extended-insert=false --add-drop-table -c -u$DBUSER_DEP -p$DBPASS_DEP -P3306 ${DBNAME_DEP}_$NO_DEP \
                                                    $TABLENAME_DEP > /home/ftpuser/sbin/${TABLENAME_DEP}_init_dep.sql
    done

    cat /home/ftpuser/sbin/*_init_dep.sql  > /home/ftpuser/sbin/tmp
    rm -rf /home/ftpuser/sbin/*_init_dep.sql
    sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
    grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init_$NO_DEP.sql
    mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb_$NO_DEP.sql
    sed -i '/insert/Id' /home/ftpuser/sbin/createdb_$NO_DEP.sql

    mv /home/ftpuser/sbin/*_$NO_DEP.sql /home/ftpuser/sbin/TABLELIST_DEP_$NO_DEP $BAKDIR_DEP

#    mysqldump -h $IP_DEP --compact --extended-insert=false -c -u$DBUSER_DEP -p$DBPASS_DEP -P3306 --databases ${DBNAME_DEP}_$NO_DEP > ${DBNAME_DEP}_${NO_DEP}_init_dep.sql

#    echo "------------${DBNAME_DEP}_${NO_DEP} successed!------------"

    NUM_DEP=`expr $NUM_DEP + 1`
done

echo "----------------------存款系统备份结束----------------------"
}





func_loan()
{
#贷款系统备份
BAKDIR_LOAN=/home/ftpuser/sbin/sqlbak/$DBUSER_LOAN$BAKDATE
if [ ! -d $BAKDIR_LOAN ];then
    mkdir $BAKDIR_LOAN
fi

echo "----------------------贷款系统备份开始----------------------"

NUM_LOAN=0
while [ $NUM_LOAN -lt 100 ];do
    if [ $NUM_LOAN -lt 10 ];then
        NO_LOAN=`echo "0$NUM_LOAN"`
    else
        NO_LOAN=$NUM_LOAN
    fi

mysql -h $IP_LOAN -u$DBUSER_LOAN -p$DBPASS_LOAN -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_LOAN_$NO_LOAN
    select table_name from information_schema.tables where table_schema='${DBNAME_LOAN}_$NO_LOAN' order by table_name;
!
     
    sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_LOAN_$NO_LOAN

    cat /home/ftpuser/sbin/TABLELIST_LOAN_$NO_LOAN | while read TABLENAME_LOAN
    do
        echo $TABLENAME_LOAN
        mysqldump -h $IP_LOAN --compact --extended-insert=false --add-drop-table -c -u$DBUSER_LOAN -p$DBPASS_LOAN -P3306 ${DBNAME_LOAN}_$NO_LOAN \
                                                    $TABLENAME_LOAN > /home/ftpuser/sbin/${TABLENAME_LOAN}_init_loan.sql
    done

    cat /home/ftpuser/sbin/*_init_loan.sql  > /home/ftpuser/sbin/tmp
    rm -rf /home/ftpuser/sbin/*_init_loan.sql
    sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
    grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init_$NO_LOAN.sql
    mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb_$NO_LOAN.sql
    sed -i '/insert/Id' /home/ftpuser/sbin/createdb_$NO_LOAN.sql

    mv /home/ftpuser/sbin/*_$NO_LOAN.sql /home/ftpuser/sbin/TABLELIST_LOAN_$NO_LOAN $BAKDIR_LOAN

#    mysqldump -h $IP_LOAN --compact --extended-insert=false -c -u$DBUSER_LOAN -p$DBPASS_LOAN -P3306 --databases ${DBNAME_LOAN}_$NO_LOAN > ${DBNAME_LOAN}_${NO_LOAN}_init_loan.sql

#    echo "------------${DBNAME_LOAN}_${NO_LOAN} successed!------------"

    NUM_LOAN=`expr $NUM_LOAN + 1`
done

echo "----------------------贷款系统备份结束----------------------"
}




func_ae()
{
#资产交换系统备份
BAKDIR_AE=/home/ftpuser/sbin/sqlbak/$DBUSER_AE$BAKDATE
if [ ! -d $BAKDIR_AE ];then
    mkdir $BAKDIR_AE
fi

echo "----------------------资产交换系统备份开始----------------------"

NUM_AE=0
while [ $NUM_AE -lt 100 ];do
    if [ $NUM_AE -lt 10 ];then
        NO_AE=`echo "0$NUM_AE"`
    else
        NO_AE=$NUM_AE
    fi

mysql -h $IP_AE -u$DBUSER_AE -p$DBPASS_AE -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_AE_$NO_AE
    select table_name from information_schema.tables where table_schema='${DBNAME_AE}_$NO_AE' order by table_name;
!
     
    sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_AE_$NO_AE

    cat /home/ftpuser/sbin/TABLELIST_AE_$NO_AE | while read TABLENAME_AE
    do
        echo $TABLENAME_AE
        mysqldump -h $IP_AE --compact --extended-insert=false --add-drop-table -c -u$DBUSER_AE -p$DBPASS_AE -P3306 ${DBNAME_AE}_$NO_AE \
                                                    $TABLENAME_AE > /home/ftpuser/sbin/${TABLENAME_AE}_init_ae.sql
    done

    cat /home/ftpuser/sbin/*_init_ae.sql  > /home/ftpuser/sbin/tmp
    rm -rf /home/ftpuser/sbin/*_init_ae.sql
    sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
    grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init_$NO_AE.sql
    mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb_$NO_AE.sql
    sed -i '/insert/Id' /home/ftpuser/sbin/createdb_$NO_AE.sql

    mv /home/ftpuser/sbin/*_$NO_AE.sql /home/ftpuser/sbin/TABLELIST_AE_$NO_AE $BAKDIR_AE

#    mysqldump -h $IP_AE --compact --extended-insert=false -c -u$DBUSER_AE -p$DBPASS_AE -P3306 --databases ${DBNAME_AE}_$NO_AE > ${DBNAME_AE}_${NO_AE}_init_ae.sql

#    echo "------------${DBNAME_AE}_${NO_AE} successed!------------"

    NUM_AE=`expr $NUM_AE + 1`
done

echo "----------------------资产交换系统备份结束----------------------"
}




func_gl()
{
#核算系统备份
BAKDIR_GL=/home/ftpuser/sbin/sqlbak/$DBUSER_GL$BAKDATE
if [ ! -d $BAKDIR_GL ];then
    mkdir $BAKDIR_GL
fi

echo "----------------------核算系统备份开始----------------------"

mysql -h $IP_GL -u$DBUSER_GL -p$DBPASS_GL -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_GL
    select table_name from information_schema.tables where table_schema='${DBNAME_GL}' order by table_name;
!

sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_GL

cat /home/ftpuser/sbin/TABLELIST_GL | while read TABLENAME_GL
do
    echo $TABLENAME_GL
    mysqldump -h $IP_GL --compact --extended-insert=false --add-drop-table -c -u$DBUSER_GL -p$DBPASS_GL -P3306 ${DBNAME_GL} \
                                                $TABLENAME_GL > /home/ftpuser/sbin/${TABLENAME_GL}_init_gl.sql
done

cat /home/ftpuser/sbin/*_init_gl.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_gl.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_GL $BAKDIR_GL

#    mysqldump -h $IP_GL --compact --extended-insert=false -c -u$DBUSER_GL -p$DBPASS_GL -P3306 --databases ${DBNAME_GL} > ${DBNAME_GL}_init_gl.sql

#    echo "------------${DBNAME_GL} successed!------------"

echo "----------------------核算系统备份结束----------------------"
}




func_supp()
{
#支持系统备份
BAKDIR_SUPP=/home/ftpuser/sbin/sqlbak/$DBUSER_SUPP$BAKDATE
if [ ! -d $BAKDIR_SUPP ];then
    mkdir $BAKDIR_SUPP
fi

echo "----------------------支持系统备份开始----------------------"

mysql -h $IP_SUPP -u$DBUSER_SUPP -p$DBPASS_SUPP -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_SUPP
    select table_name from information_schema.tables where table_schema='${DBNAME_SUPP}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_SUPP

cat /home/ftpuser/sbin/TABLELIST_SUPP | while read TABLENAME_SUPP
do
    echo $TABLENAME_SUPP
    mysqldump -h $IP_SUPP --compact --extended-insert=false --add-drop-table -c -u$DBUSER_SUPP -p$DBPASS_SUPP -P3306 ${DBNAME_SUPP} \
                                                $TABLENAME_SUPP > /home/ftpuser/sbin/${TABLENAME_SUPP}_init_supp.sql
done

cat /home/ftpuser/sbin/*_init_supp.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_supp.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_SUPP $BAKDIR_SUPP

#    mysqldump -h $IP_SUPP --compact --extended-insert=false -c -u$DBUSER_SUPP -p$DBPASS_SUPP -P3306 --databases ${DBNAME_SUPP} > ${DBNAME_SUPP}_init_supp.sql

#    echo "------------${DBNAME_SUPP} successed!------------"

echo "----------------------支持系统备份结束----------------------"
}




func_ia()
{
#内部帐系统备份
BAKDIR_IA=/home/ftpuser/sbin/sqlbak/$DBUSER_IA$BAKDATE
if [ ! -d $BAKDIR_IA ];then
    mkdir $BAKDIR_IA
fi

echo "----------------------内部帐系统备份开始----------------------"

mysql -h $IP_IA -u$DBUSER_IA -p$DBPASS_IA -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_IA
    select table_name from information_schema.tables where table_schema='${DBNAME_IA}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_IA

cat /home/ftpuser/sbin/TABLELIST_IA | while read TABLENAME_IA
do
    echo $TABLENAME_IA
    mysqldump -h $IP_IA --compact --extended-insert=false --add-drop-table -c -u$DBUSER_IA -p$DBPASS_IA -P3306 ${DBNAME_IA} \
                                                $TABLENAME_IA > /home/ftpuser/sbin/${TABLENAME_IA}_init_ia.sql
done

cat /home/ftpuser/sbin/*_init_ia.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_ia.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_IA $BAKDIR_IA

#    mysqldump -h $IP_IA --compact --extended-insert=false -c -u$DBUSER_IA -p$DBPASS_IA -P3306 --databases ${DBNAME_IA} > ${DBNAME_IA}_init_ia.sql

#    echo "------------${DBNAME_IA} successed!------------"

echo "----------------------内部帐系统备份结束----------------------"
}




func_cbmg()
{
#后管系统备份
BAKDIR_CBMG=/home/ftpuser/sbin/sqlbak/$DBUSER_CBMG$BAKDATE
if [ ! -d $BAKDIR_CBMG ];then
    mkdir $BAKDIR_CBMG
fi

echo "----------------------后管系统备份开始----------------------"

mysql -h $IP_CBMG -u$DBUSER_CBMG -p$DBPASS_CBMG -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_CBMG
    select table_name from information_schema.tables where table_schema='${DBNAME_CBMG}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_CBMG

cat /home/ftpuser/sbin/TABLELIST_CBMG | while read TABLENAME_CBMG
do
    echo $TABLENAME_CBMG
    mysqldump -h $IP_CBMG --compact --extended-insert=false --add-drop-table -c -u$DBUSER_CBMG -p$DBPASS_CBMG -P3306 ${DBNAME_CBMG} \
                                                $TABLENAME_CBMG > /home/ftpuser/sbin/${TABLENAME_CBMG}_init_cbmg.sql
done

cat /home/ftpuser/sbin/*_init_cbmg.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_cbmg.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_CBMG $BAKDIR_CBMG

#    mysqldump -h $IP_CBMG --compact --extended-insert=false -c -u$DBUSER_CBMG -p$DBPASS_CBMG -P3306 --databases ${DBNAME_CBMG} > ${DBNAME_CBMG}_init_cbmg.sql

#    echo "------------${DBNAME_CBMG} successed!------------"

echo "----------------------后管系统备份结束----------------------"
}



func_batch()
{
#批量系统备份
BAKDIR_BATCH=/home/ftpuser/sbin/sqlbak/"batch"$BAKDATE
if [ ! -d $BAKDIR_BATCH ];then
    mkdir $BAKDIR_BATCH
fi

echo "----------------------批量系统备份开始----------------------"

mysql -h $IP_BATCH -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_BATCH1
    select table_name from information_schema.tables where table_schema='${DBNAME1_BATCH}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_BATCH1

cat /home/ftpuser/sbin/TABLELIST_BATCH1 | while read TABLENAME_BATCH1
do
    echo $TABLENAME_BATCH1
    mysqldump -h $IP_BATCH --compact --extended-insert=false --add-drop-table -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 ${DBNAME1_BATCH} \
                                                $TABLENAME_BATCH1 > /home/ftpuser/sbin/${TABLENAME_BATCH1}_init_batch.sql
done

cat /home/ftpuser/sbin/*_init_batch.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_batch.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/${DBNAME1_BATCH}_init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/${DBNAME1_BATCH}_createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/${DBNAME1_BATCH}_createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_BATCH1 $BAKDIR_BATCH

#    mysqldump -h $IP_BATCH --compact --extended-insert=false -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 --databases ${DBNAME1_BATCH} > ${DBNAME1_BATCH}_init_batch.sql

#    echo "------------${DBNAME1_BATCH} successed!------------"






mysql -h $IP_BATCH -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_BATCH2
    select table_name from information_schema.tables where table_schema='${DBNAME2_BATCH}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_BATCH2

cat /home/ftpuser/sbin/TABLELIST_BATCH2 | while read TABLENAME_BATCH2
do
    echo $TABLENAME_BATCH2
    mysqldump -h $IP_BATCH --compact --extended-insert=false --add-drop-table -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 ${DBNAME2_BATCH} \
                                                $TABLENAME_BATCH2 > /home/ftpuser/sbin/${TABLENAME_BATCH2}_init_batch.sql
done

cat /home/ftpuser/sbin/*_init_batch.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_batch.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/${DBNAME2_BATCH}_init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/${DBNAME2_BATCH}_createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/${DBNAME2_BATCH}_createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_BATCH2 $BAKDIR_BATCH

#    mysqldump -h $IP_BATCH --compact --extended-insert=false -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 --databases ${DBNAME2_BATCH} > ${DBNAME2_BATCH}_init_batch.sql

#    echo "------------${DBNAME2_BATCH} successed!------------"






mysql -h $IP_BATCH -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_BATCH3
    select table_name from information_schema.tables where table_schema='${DBNAME3_BATCH}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_BATCH3

cat /home/ftpuser/sbin/TABLELIST_BATCH3 | while read TABLENAME_BATCH3
do
    echo $TABLENAME_BATCH3
    mysqldump -h $IP_BATCH --compact --extended-insert=false --add-drop-table -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 ${DBNAME3_BATCH} \
                                                $TABLENAME_BATCH3 > /home/ftpuser/sbin/${TABLENAME_BATCH3}_init_batch.sql
done

cat /home/ftpuser/sbin/*_init_batch.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_batch.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/${DBNAME3_BATCH}_init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/${DBNAME3_BATCH}_createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/${DBNAME3_BATCH}_createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_BATCH3 $BAKDIR_BATCH

#    mysqldump -h $IP_BATCH --compact --extended-insert=false -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 --databases ${DBNAME3_BATCH} > ${DBNAME3_BATCH}_init_batch.sql

#    echo "------------${DBNAME3_BATCH} successed!------------"






mysql -h $IP_BATCH -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_BATCH4
    select table_name from information_schema.tables where table_schema='${DBNAME4_BATCH}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_BATCH4

cat /home/ftpuser/sbin/TABLELIST_BATCH4 | while read TABLENAME_BATCH4
do
    echo $TABLENAME_BATCH4
    mysqldump -h $IP_BATCH --compact --extended-insert=false --add-drop-table -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 ${DBNAME4_BATCH} \
                                                $TABLENAME_BATCH4 > /home/ftpuser/sbin/${TABLENAME_BATCH4}_init_batch.sql
done

cat /home/ftpuser/sbin/*_init_batch.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_batch.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/${DBNAME4_BATCH}_init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/${DBNAME4_BATCH}_createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/${DBNAME4_BATCH}_createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_BATCH4 $BAKDIR_BATCH

#    mysqldump -h $IP_BATCH --compact --extended-insert=false -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 --databases ${DBNAME4_BATCH} > ${DBNAME4_BATCH}_init_batch.sql

#    echo "------------${DBNAME4_BATCH} successed!------------"






mysql -h $IP_BATCH -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_BATCH5
    select table_name from information_schema.tables where table_schema='${DBNAME5_BATCH}' order by table_name;
!
     
sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_BATCH5

cat /home/ftpuser/sbin/TABLELIST_BATCH5 | while read TABLENAME_BATCH5
do
    echo $TABLENAME_BATCH5
    mysqldump -h $IP_BATCH --compact --extended-insert=false --add-drop-table -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 ${DBNAME5_BATCH} \
                                                $TABLENAME_BATCH5 > /home/ftpuser/sbin/${TABLENAME_BATCH5}_init_batch.sql
done

cat /home/ftpuser/sbin/*_init_batch.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_batch.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/${DBNAME5_BATCH}_init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/${DBNAME5_BATCH}_createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/${DBNAME5_BATCH}_createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_BATCH5 $BAKDIR_BATCH

#    mysqldump -h $IP_BATCH --compact --extended-insert=false -c -u$DBUSER_BATCH -p$DBPASS_BATCH -P3306 --databases ${DBNAME5_BATCH} > ${DBNAME5_BATCH}_init_batch.sql

#    echo "------------${DBNAME5_BATCH} successed!------------"

echo "----------------------批量系统备份结束----------------------"
}





func_col()
{
#客户中心系统备份
BAKDIR_COL=/home/ftpuser/sbin/sqlbak/$DBUSER_COL$BAKDATE
if [ ! -d $BAKDIR_COL ];then
    mkdir $BAKDIR_COL
fi

echo "----------------------客户中心系统备份开始----------------------"

mysql -h $IP_COL -u$DBUSER_COL -p$DBPASS_COL -P3306 <<! 1> /home/ftpuser/sbin/TABLELIST_COL
    select table_name from information_schema.tables where table_schema='${DBNAME_COL}' order by table_name;
!

sed -i '/table_name/d' /home/ftpuser/sbin/TABLELIST_COL

cat /home/ftpuser/sbin/TABLELIST_COL | while read TABLENAME_COL
do
    echo $TABLENAME_COL
    mysqldump -h $IP_COL --compact --extended-insert=false --add-drop-table -c -u$DBUSER_COL -p$DBPASS_COL -P3306 ${DBNAME_COL} \
                                                $TABLENAME_COL > /home/ftpuser/sbin/${TABLENAME_COL}_init_col.sql
done

cat /home/ftpuser/sbin/*_init_col.sql  > /home/ftpuser/sbin/tmp
rm -rf /home/ftpuser/sbin/*_init_col.sql
sed -i -e '/*/d' -e '/--/d' -e 's/`//g' /home/ftpuser/sbin/tmp
grep -i -w insert /home/ftpuser/sbin/tmp > /home/ftpuser/sbin/init.sql
mv /home/ftpuser/sbin/tmp /home/ftpuser/sbin/createdb.sql
sed -i '/insert/Id' /home/ftpuser/sbin/createdb.sql

mv /home/ftpuser/sbin/*.sql /home/ftpuser/sbin/TABLELIST_COL $BAKDIR_COL

#    mysqldump -h $IP_COL --compact --extended-insert=false -c -u$DBUSER_COL -p$DBPASS_COL -P3306 --databases ${DBNAME_COL} > ${DBNAME_COL}_init_col.sql

#    echo "------------${DBNAME_COL} successed!------------"

echo "----------------------客户中心系统备份结束----------------------"
}

if [ $1 == "dep" ];then
    func_dep
elif [ $1 == "loan" ];then
    func_loan
elif [ $1 == "gl" ];then
    func_gl
elif [ $1 == "supp" ];then
    func_supp
elif [ $1 == "ia" ];then
    func_ia
elif [ $1 == "cbmg" ];then
    func_cbmg
elif [ $1 == "ae" ];then
    func_ae
elif [ $1 == "batch" ];then
    func_batch
elif [ $1 == "col" ];then
    func_col
elif [ $1 == "all" ];then
    func_dep
    func_loan
    func_gl
    func_supp
    func_ia
    func_cbmg
    func_ae
    func_batch
    func_col
else
    echo "输入参数有误，请重新输入!"
    exit 1
fi

cd /home/ftpuser/sbin/sqlbak
tar -zcvf dev_${BAKDATE}.tar.gz *$BAKDATE
rm -rf *$BAKDATE

