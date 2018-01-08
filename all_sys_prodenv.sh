#本脚本用于部署所有系统生产环境的建库及初始化脚本

func_dep()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_dep_app@dep_tenant 3yvoA8pA cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi
    echo "dep exec success!"
}

func_loan()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_loan_app@loan_tenant 3kwNKzl5 cb_loan /home/ftpuser/tmp_loan.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi
    echo "loan exec success!"
}

func_ae()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_ae_app@ae_tenant ga9LSyh3 cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi
    echo "ae exec success!"
}

func_gl()
{
    mysql -h 10.2.8.95 -ucb_gl_app@gl_tenant -p0vt3CudJ -P3306 -Dcb_gl_global < /home/ftpuser/tmp_gl.sql
    mysql -h 10.2.8.95 -ucb_gl_app@gl_tenant -p0vt3CudJ -P3306 -Dcb_gl_global < /home/ftpuser/tmp_gl_init.sql

    echo "gl exec success!"
}

func_ia()
{
    mysql -h 10.2.8.95 -ucb_ia_app@ia_tenant -p0bc8IMmg -P3306 -Dcb_ia_global < /home/ftpuser/tmp_ia.sql
    mysql -h 10.2.8.95 -ucb_ia_app@ia_tenant -p0bc8IMmg -P3306 -Dcb_ia_global < /home/ftpuser/tmp_ia_init.sql

    echo "ia exec success!"
}

func_supp()
{
    mysql -h 10.2.8.95 -ucb_supp_app@supp_tenant -pjdI87Dae -P3306 -Dcb_supp_global < /home/ftpuser/tmp_supp.sql
    mysql -h 10.2.8.95 -ucb_supp_app@supp_tenant -pjdI87Dae -P3306 -Dcb_supp_global < /home/ftpuser/tmp_supp_init.sql

    echo "supp exec success!"
}

func_cbmg()
{
    mysql -h 10.2.8.95 -uco_cbmg_app@co_tenant -psW91aaKp -P3306 -Dco_cbmg_global < /home/ftpuser/tmp_cbmg.sql
    mysql -h 10.2.8.95 -uco_cbmg_app@co_tenant -psW91aaKp -P3306 -Dco_cbmg_global < /home/ftpuser/tmp_cbmg_init.sql

    echo "cbmg exec success!"
}

func_col()
{
    mysql -h 10.2.8.95 -ucs_col_app@cs_tenant -plfe7Fy9M -P3306 -Dcs_col_global < /home/ftpuser/tmp_col.sql
    mysql -h 10.2.8.95 -ucs_col_app@cs_tenant -plfe7Fy9M -P3306 -Dcs_col_global < /home/ftpuser/tmp_col_init.sql

    echo "col exec success!"
}

func_batch()
{
    mysql -h 10.2.8.95 -ucb_batch_app@batch_tenant -p1Yp1Iwy1 -P3306 -Dcb_batch_global < /home/ftpuser/tmp_batch.sql
    mysql -h 10.2.8.95 -ucb_batch_app@batch_tenant -p1Yp1Iwy1 -P3306 -Dcb_batch_global < /home/ftpuser/tmp_batch_init.sql

    echo "batch exec success!"
}

func_gl_batch()
{
    mysql -h 10.2.8.95 -ucb_gl_batch_app@batch_tenant -pT5tuhg3D -P3306 -Dcb_gl_batch_global < /home/ftpuser/tmp_gl_batch.sql
    mysql -h 10.2.8.95 -ucb_gl_batch_app@batch_tenant -pT5tuhg3D -P3306 -Dcb_gl_batch_global < /home/ftpuser/tmp_gl_batch_init.sql

    echo "gl_batch exec success!"
}

func_ia_batch()
{
    mysql -h 10.2.8.95 -ucb_ia_batch_app@batch_tenant -pF55umOds -P3306 -Dcb_ia_batch_global < /home/ftpuser/tmp_ia_batch.sql
    mysql -h 10.2.8.95 -ucb_ia_batch_app@batch_tenant -pF55umOds -P3306 -Dcb_ia_batch_global < /home/ftpuser/tmp_ia_batch_init.sql

    echo "ia_batch exec success!"
}

func_dep_batch()
{
    mysql -h 10.2.8.95 -ucb_dep_batch_app@batch_tenant -pjKlm5gR2 -P3306 -Dcb_dep_batch_global < /home/ftpuser/tmp_dep_batch.sql
    mysql -h 10.2.8.95 -ucb_dep_batch_app@batch_tenant -pjKlm5gR2 -P3306 -Dcb_dep_batch_global < /home/ftpuser/tmp_dep_batch_init.sql

    echo "dep_batch exec success!"
}

func_loan_batch()
{
    mysql -h 10.2.8.95 -ucb_loan_batch_app@batch_tenant -pz4CtiP9s -P3306 -Dcb_loan_batch_global < /home/ftpuser/tmp_loan_batch.sql
    mysql -h 10.2.8.95 -ucb_loan_batch_app@batch_tenant -pz4CtiP9s -P3306 -Dcb_loan_batch_global < /home/ftpuser/tmp_loan_batch_init.sql

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
