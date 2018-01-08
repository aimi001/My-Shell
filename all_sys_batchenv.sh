#本脚本用于部署所有系统批量环境的建库及初始化脚本

func_dep()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.93 root itfin1020 cb_dep /home/ftpuser/tmp_dep_truncate.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi
    #sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.93 root itfin1020 cb_dep /home/ftpuser/tmp_dep_create.sql
    #if [ $? -ne 0 ];then
    #    echo "dep error!"
    #    exit 1
    #fi
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.93 root itfin1020 cb_dep /home/ftpuser/tmp_dep_init.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi
    echo "dep exec success!"
}

func_loan()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.96 root itfin1020 cb_loan /home/ftpuser/tmp_loan_truncate.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi
    #sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.96 root itfin1020 cb_loan /home/ftpuser/tmp_loan_create.sql
    #if [ $? -ne 0 ];then
    #    echo "loan error!"
    #    exit 1
    #fi
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.96 root itfin1020 cb_loan /home/ftpuser/tmp_loan_init.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi
    echo "loan exec success!"
}

func_ae()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.88 root itfin1020 cb_ae /home/ftpuser/tmp_ae_truncate.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi
    #sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.88 root itfin1020 cb_ae /home/ftpuser/tmp_ae_create.sql
    #if [ $? -ne 0 ];then
    #    echo "ae error!"
    #    exit 1
    #fi
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.88 root itfin1020 cb_ae /home/ftpuser/tmp_ae_init.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi
    echo "ae exec success!"
}

func_gl()
{
    mysql -h 10.248.1.94 -uroot -pitfin1020 -P3306 -Dcb_gl < /home/ftpuser/tmp_gl_truncate.sql
    #mysql -h 10.248.1.94 -uroot -pitfin1020 -P3306 -Dcb_gl < /home/ftpuser/tmp_gl_create.sql
    mysql -h 10.248.1.94 -uroot -pitfin1020 -P3306 -Dcb_gl < /home/ftpuser/tmp_gl_init.sql

    echo "gl exec success!"
}

func_ia()
{
    mysql -h 10.248.1.95 -uroot -pitfin1020 -P3306 -Dcb_ia < /home/ftpuser/tmp_ia_truncate.sql
    #mysql -h 10.248.1.95 -uroot -pitfin1020 -P3306 -Dcb_ia < /home/ftpuser/tmp_ia_create.sql
    mysql -h 10.248.1.95 -uroot -pitfin1020 -P3306 -Dcb_ia < /home/ftpuser/tmp_ia_init.sql

    echo "ia exec success!"
}

func_supp()
{
    mysql -h 10.248.1.100 -uroot -pitfin1020 -P3306 -Dcb_supp < /home/ftpuser/tmp_supp_truncate.sql
    #mysql -h 10.248.1.100 -uroot -pitfin1020 -P3306 -Dcb_supp < /home/ftpuser/tmp_supp_create.sql
    mysql -h 10.248.1.100 -uroot -pitfin1020 -P3306 -Dcb_supp < /home/ftpuser/tmp_supp_init.sql

    echo "supp exec success!"
}

func_cbmg()
{
    mysql -h 10.248.1.90 -uroot -pitfin1020 -P3306 -Dco_cbmg < /home/ftpuser/tmp_cbmg_truncate.sql
    #mysql -h 10.248.1.90 -uroot -pitfin1020 -P3306 -Dco_cbmg < /home/ftpuser/tmp_cbmg_create.sql
    mysql -h 10.248.1.90 -uroot -pitfin1020 -P3306 -Dco_cbmg < /home/ftpuser/tmp_cbmg_init.sql

    echo "cbmg exec success!"
}

func_col()
{
    mysql -h 10.248.1.92 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/tmp_col_truncate.sql
    #mysql -h 10.248.1.92 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/tmp_col_create.sql
    mysql -h 10.248.1.92 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/tmp_col_init.sql

    echo "col exec success!"
}

func_batch()
{
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_batch < /home/ftpuser/tmp_batch_truncate.sql
    #mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_batch < /home/ftpuser/tmp_batch_create.sql
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_batch < /home/ftpuser/tmp_batch_init.sql

    echo "batch exec success!"
}

func_gl_batch()
{
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_gl_batch < /home/ftpuser/tmp_gl_batch_truncate.sql
    #mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_gl_batch < /home/ftpuser/tmp_gl_batch_create.sql
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_gl_batch < /home/ftpuser/tmp_gl_batch_init.sql

    echo "gl_batch exec success!"
}

func_ia_batch()
{
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_ia_batch < /home/ftpuser/tmp_ia_batch_truncate.sql
    #mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_ia_batch < /home/ftpuser/tmp_ia_batch_create.sql
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_ia_batch < /home/ftpuser/tmp_ia_batch_init.sql

    echo "ia_batch exec success!"
}

func_dep_batch()
{
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_dep_batch < /home/ftpuser/tmp_dep_batch_truncate.sql
    #mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_dep_batch < /home/ftpuser/tmp_dep_batch_create.sql
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_dep_batch < /home/ftpuser/tmp_dep_batch_init.sql

    echo "dep_batch exec success!"
}

func_loan_batch()
{
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_loan_batch < /home/ftpuser/tmp_loan_batch_truncate.sql
    #mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_loan_batch < /home/ftpuser/tmp_loan_batch_create.sql
    mysql -h 10.248.1.89 -uroot -pitfin1020 -P3306 -Dcb_loan_batch < /home/ftpuser/tmp_loan_batch_init.sql

    echo "loan_batch exec success!"
}


func_gl 
func_ia 
func_supp 
func_cbmg 
func_col 
func_batch 
func_gl_batch 
func_ia_batch 
func_dep_batch 
func_loan_batch 
func_ae 
func_dep 
func_loan 
#wait
