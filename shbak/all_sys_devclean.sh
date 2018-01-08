#本脚本用于部署所有系统DEV环境的建库及初始化脚本

func_dep()
{
    #sh /home/ftpuser/sbin/to_10_database.sh cb_dep /home/ftpuser/tmp_dep_truncate.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
#mysql -h 10.245.1.165 -udep -pdep -P3306 <<!
#    source /home/ftpuser/sbin/tmp.sql     
#!
    #if [ $? -ne 0 ];then
    #    echo "dep error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_dep /home/ftpuser/tmp_dep_create.sql
    mysql -h 10.245.1.165 -udep -pdep -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_dep /home/ftpuser/tmp_dep_init.sql
    mysql -h 10.245.1.165 -udep -pdep -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi
    echo "dep exec success!"
}

func_loan()
{
    #sh /home/ftpuser/sbin/to_10_database.sh cb_loan /home/ftpuser/tmp_loan_truncate.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 < /home/ftpuser/sbin/tmp.sql
    #if [ $? -ne 0 ];then
    #    echo "loan error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_loan /home/ftpuser/tmp_loan_create.sql
    mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_loan /home/ftpuser/tmp_loan_init.sql
    mysql -h 10.245.1.223 -ucb_loan -pcb_loan -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi
    echo "loan exec success!"
}

func_ae()
{
    #sh /home/ftpuser/sbin/to_10_database.sh cb_ae /home/ftpuser/tmp_ae_truncate.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 < /home/ftpuser/sbin/tmp.sql
    #if [ $? -ne 0 ];then
    #    echo "ae error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_ae /home/ftpuser/tmp_ae_create.sql
    mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi

    sh /home/ftpuser/sbin/to_10_database.sh cb_ae /home/ftpuser/tmp_ae_init.sql
    mysql -h 10.245.1.226 -ucb_ae -pcb_ae -P3306 < /home/ftpuser/sbin/tmp.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi
    echo "ae exec success!"
}

func_gl()
{
    #cp /home/ftpuser/tmp_gl_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dcb_gl < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dcb_gl < /home/ftpuser/tmp_gl_create.sql
    mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dcb_gl < /home/ftpuser/tmp_gl_init.sql

    echo "gl exec success!"
}

func_ia()
{
    #cp /home/ftpuser/tmp_ia_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dcb_ia < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dcb_ia < /home/ftpuser/tmp_ia_create.sql
    mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dcb_ia < /home/ftpuser/tmp_ia_init.sql

    echo "ia exec success!"
}

func_supp()
{
    #cp /home/ftpuser/tmp_supp_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dcb_supp < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dcb_supp < /home/ftpuser/tmp_supp_create.sql
    mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dcb_supp < /home/ftpuser/tmp_supp_init.sql

    echo "supp exec success!"
}

func_cbmg()
{
    #cp /home/ftpuser/tmp_cbmg_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dco_cbmg < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dco_cbmg < /home/ftpuser/tmp_cbmg_create.sql
    mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dco_cbmg < /home/ftpuser/tmp_cbmg_init.sql

    echo "cbmg exec success!"
}

func_col()
{
    #cp /home/ftpuser/tmp_col_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/tmp_col_create.sql
    mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dcs_col < /home/ftpuser/tmp_col_init.sql

    echo "col exec success!"
}

func_batch()
{
    #cp /home/ftpuser/tmp_batch_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_batch < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_batch < /home/ftpuser/tmp_batch_create.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_batch < /home/ftpuser/tmp_batch_init.sql

    echo "batch exec success!"
}

func_gl_batch()
{
    #cp /home/ftpuser/tmp_gl_batch_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_gl_batch < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_gl_batch < /home/ftpuser/tmp_gl_batch_create.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_gl_batch < /home/ftpuser/tmp_gl_batch_init.sql

    echo "gl_batch exec success!"
}

func_ia_batch()
{
    #cp /home/ftpuser/tmp_ia_batch_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_ia_batch < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_ia_batch < /home/ftpuser/tmp_ia_batch_create.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_ia_batch < /home/ftpuser/tmp_ia_batch_init.sql

    echo "ia_batch exec success!"
}

func_dep_batch()
{
    #cp /home/ftpuser/tmp_dep_batch_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_dep_batch < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_dep_batch < /home/ftpuser/tmp_dep_batch_create.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_dep_batch < /home/ftpuser/tmp_dep_batch_init.sql

    echo "dep_batch exec success!"
}

func_loan_batch()
{
    #cp /home/ftpuser/tmp_loan_batch_truncate.sql /home/ftpuser/sbin/tmp.sql
    #sed -i 's/truncate table/delete from/Ig' /home/ftpuser/sbin/tmp.sql
    #mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_loan_batch < /home/ftpuser/sbin/tmp.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_loan_batch < /home/ftpuser/tmp_loan_batch_create.sql
    mysql -h 10.245.1.227 -ubatch -pbatch -P3306 -Dcb_loan_batch < /home/ftpuser/tmp_loan_batch_init.sql

    echo "loan_batch exec success!"
}


func_ae
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
func_loan  
func_dep 
#wait
