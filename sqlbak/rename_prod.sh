rm -rf ~/tmp*.sql
rm -rf ~/sbin/sqlbak/guo/tmp*.sql

cd ~/sbin/sqlbak/col* 
cp init.sql ../guo/tmp_col_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_COL > tmp_col_truncate.sql
mv tmp_col_truncate.sql ../guo

cd ~/sbin/sqlbak/gl* 
cp init.sql ../guo/tmp_gl_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_GL > tmp_gl_truncate.sql
mv tmp_gl_truncate.sql ../guo

cd ~/sbin/sqlbak/ia* 
cp init.sql ../guo/tmp_ia_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_IA > tmp_ia_truncate.sql
mv tmp_ia_truncate.sql ../guo

cd ~/sbin/sqlbak/cbmg* 
cp init.sql ../guo/tmp_cbmg_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_CBMG > tmp_cbmg_truncate.sql
mv tmp_cbmg_truncate.sql ../guo

cd ~/sbin/sqlbak/supp*
cp init.sql ../guo/tmp_supp_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_SUPP > tmp_supp_truncate.sql
mv tmp_supp_truncate.sql ../guo

cd ~/sbin/sqlbak/loan* 
cp init.sql ../guo/tmp_loan_init.sql
sed -e 's/^/truncate table /g' -e 's/$/_##;/g' TABLELIST_LOAN > tmp_loan_truncate.sql
sed -i 's/dbp_sequence/dbp_sequence_##/g' ~/sbin/sqlbak/guo/tmp_loan_init.sql
mv tmp_loan_truncate.sql ../guo
sh ~/sbin/tmp_sql.sh cb_loan ~/sbin/sqlbak/guo/tmp_loan_truncate.sql
mv ~/sbin/tmp_cb_loan.sql ~/sbin/sqlbak/guo/tmp_loan_truncate.sql
sh ~/sbin/tmp_sql.sh cb_loan ~/sbin/sqlbak/guo/tmp_loan_init.sql
mv ~/sbin/tmp_cb_loan.sql ~/sbin/sqlbak/guo/tmp_loan_init.sql

cd ~/sbin/sqlbak/dep* 
cp init.sql ../guo/tmp_dep_init.sql
sed -e 's/^/truncate table /g' -e 's/$/_##;/g' TABLELIST_DEP > tmp_dep_truncate.sql
sed -i 's/dbp_sequence/dbp_sequence_##/g' ~/sbin/sqlbak/guo/tmp_dep_init.sql
mv tmp_dep_truncate.sql ../guo
sh ~/sbin/tmp_sql.sh cb_dep ~/sbin/sqlbak/guo/tmp_dep_truncate.sql
mv ~/sbin/tmp_cb_dep.sql ~/sbin/sqlbak/guo/tmp_dep_truncate.sql
sh ~/sbin/tmp_sql.sh cb_dep ~/sbin/sqlbak/guo/tmp_dep_init.sql
mv ~/sbin/tmp_cb_dep.sql ~/sbin/sqlbak/guo/tmp_dep_init.sql

cd ~/sbin/sqlbak/cb_ae* 
cp init.sql ../guo/tmp_ae_init.sql
sed -e 's/^/truncate table /g' -e 's/$/_##;/g' TABLELIST_AE > tmp_ae_truncate.sql
mv tmp_ae_truncate.sql ../guo
sh ~/sbin/tmp_sql.sh cb_ae ~/sbin/sqlbak/guo/tmp_ae_truncate.sql
mv ~/sbin/tmp_cb_ae.sql ~/sbin/sqlbak/guo/tmp_ae_truncate.sql
sh ~/sbin/tmp_sql.sh cb_ae ~/sbin/sqlbak/guo/tmp_ae_init.sql
mv ~/sbin/tmp_cb_ae.sql ~/sbin/sqlbak/guo/tmp_ae_init.sql

cd ~/sbin/sqlbak/batch*
cp batch_init.sql ../guo/tmp_batch_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_BATCH1 > tmp_batch_truncate.sql
mv tmp_batch_truncate.sql ../guo
cp dep_batch_init.sql ../guo/tmp_dep_batch_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_BATCH2 > tmp_dep_batch_truncate.sql
mv tmp_dep_batch_truncate.sql ../guo
cp loan_batch_init.sql ../guo/tmp_loan_batch_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_BATCH3 > tmp_loan_batch_truncate.sql
mv tmp_loan_batch_truncate.sql ../guo
cp gl_batch_init.sql ../guo/tmp_gl_batch_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_BATCH4 > tmp_gl_batch_truncate.sql
mv tmp_gl_batch_truncate.sql ../guo
cp ia_batch_init.sql ../guo/tmp_ia_batch_init.sql
sed -e 's/^/truncate table /g' -e 's/$/;/g' TABLELIST_BATCH5 > tmp_ia_batch_truncate.sql
mv tmp_ia_batch_truncate.sql ../guo

cd ~/sbin/sqlbak/guo
cp tmp*.sql ~

