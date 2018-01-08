#本脚本用于部署所有系统SIT环境的建库及初始化脚本

func_dep()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_dep_truncate.sql
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.165 dep dep sit_cb_dep /home/ftpuser/tmp_dep_truncate.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi

    #sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.165 dep dep sit_cb_dep /home/ftpuser/tmp_dep_create.sql
    #if [ $? -ne 0 ];then
    #    echo "dep error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.165 dep dep sit_cb_dep /home/ftpuser/tmp_dep_init.sql
    if [ $? -ne 0 ];then
        echo "dep error!"
        exit 1
    fi

    echo "dep exec success!"
}

func_loan()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_loan_truncate.sql
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.223 cb_loan cb_loan sit_cb_loan /home/ftpuser/tmp_loan_truncate.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi

    #sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.223 cb_loan cb_loan sit_cb_loan /home/ftpuser/tmp_loan_create.sql
    #if [ $? -ne 0 ];then
    #    echo "loan error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.223 cb_loan cb_loan sit_cb_loan /home/ftpuser/tmp_loan_init.sql
    if [ $? -ne 0 ];then
        echo "loan error!"
        exit 1
    fi

    echo "loan exec success!"
}

func_ae()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_ae_truncate.sql
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.226 cb_ae cb_ae sit_cb_ae /home/ftpuser/tmp_ae_truncate.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi

    #sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.226 cb_ae cb_ae sit_cb_ae /home/ftpuser/tmp_ae_create.sql
    #if [ $? -ne 0 ];then
    #    echo "ae error!"
    #    exit 1
    #fi

    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.226 cb_ae cb_ae sit_cb_ae /home/ftpuser/tmp_ae_init.sql
    if [ $? -ne 0 ];then
        echo "ae error!"
        exit 1
    fi

    echo "ae exec success!"
}

func_gl()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_gl_truncate.sql
    mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dsit_cb_gl < /home/ftpuser/tmp_gl_truncate.sql
    #mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dsit_cb_gl < /home/ftpuser/tmp_gl_create.sql
    mysql -h 10.245.1.225 -ucb_gl -pcb_gl -P3306 -Dsit_cb_gl < /home/ftpuser/tmp_gl_init.sql

    echo "gl exec success!"
}

func_ia()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_ia_truncate.sql
    mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dsit_cb_ia < /home/ftpuser/tmp_ia_truncate.sql
    #mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dsit_cb_ia < /home/ftpuser/tmp_ia_create.sql
    mysql -h 10.245.1.224 -ucb_ia -pcb_ia -P3306 -Dsit_cb_ia < /home/ftpuser/tmp_ia_init.sql

    echo "ia exec success!"
}

func_supp()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_supp_truncate.sql
    mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dsit_cb_supp < /home/ftpuser/tmp_supp_truncate.sql
    #mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dsit_cb_supp < /home/ftpuser/tmp_supp_create.sql
    mysql -h 10.245.1.224 -ucb_supp -pcb_supp -P3306 -Dsit_cb_supp < /home/ftpuser/tmp_supp_init.sql

    echo "supp exec success!"
}

func_cbmg()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_cbmg_truncate.sql
    mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dsit_co_cbmg < /home/ftpuser/tmp_cbmg_truncate.sql
    #mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dsit_co_cbmg < /home/ftpuser/tmp_cbmg_create.sql
    mysql -h 10.245.1.232 -uco_cbmg -pco_cbmg -P3306 -Dsit_co_cbmg < /home/ftpuser/tmp_cbmg_init.sql

    echo "cbmg exec success!"
}

func_col()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_col_truncate.sql
    mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dsit_cs_col < /home/ftpuser/tmp_col_truncate.sql
    #mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dsit_cs_col < /home/ftpuser/tmp_col_create.sql
    mysql -h 10.245.1.164 -uroot -pitfin1020 -P3306 -Dsit_cs_col < /home/ftpuser/tmp_col_init.sql

    echo "col exec success!"
}

func_batch()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_batch_truncate.sql
    mysql -h 10.245.1.227 -ucb_batch -pcb_batch -P3306 -Dsit_cb_batch < /home/ftpuser/tmp_batch_truncate.sql
    #mysql -h 10.245.1.227 -ucb_batch -pcb_batch -P3306 -Dsit_cb_batch < /home/ftpuser/tmp_batch_create.sql
    mysql -h 10.245.1.227 -ucb_batch -pcb_batch -P3306 -Dsit_cb_batch < /home/ftpuser/tmp_batch_init.sql

    echo "batch exec success!"
}

func_gl_batch()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_gl_batch_truncate.sql
    mysql -h 10.245.1.227 -ucb_gl_batch -pcb_gl_batch -P3306 -Dsit_cb_gl_batch < /home/ftpuser/tmp_gl_batch_truncate.sql
    #mysql -h 10.245.1.227 -ucb_gl_batch -pcb_gl_batch -P3306 -Dsit_cb_gl_batch < /home/ftpuser/tmp_gl_batch_create.sql
    mysql -h 10.245.1.227 -ucb_gl_batch -pcb_gl_batch -P3306 -Dsit_cb_gl_batch < /home/ftpuser/tmp_gl_batch_init.sql

    echo "gl_batch exec success!"
}

func_ia_batch()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_ia_batch_truncate.sql
    mysql -h 10.245.1.227 -ucb_ia_batch -pcb_ia_batch -P3306 -Dsit_cb_ia_batch < /home/ftpuser/tmp_ia_batch_truncate.sql
    #mysql -h 10.245.1.227 -ucb_ia_batch -pcb_ia_batch -P3306 -Dsit_cb_ia_batch < /home/ftpuser/tmp_ia_batch_create.sql
    mysql -h 10.245.1.227 -ucb_ia_batch -pcb_ia_batch -P3306 -Dsit_cb_ia_batch < /home/ftpuser/tmp_ia_batch_init.sql

    echo "ia_batch exec success!"
}

func_dep_batch()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_dep_batch_truncate.sql
    mysql -h 10.245.1.227 -ucb_dep_batch -pcb_dep_batch -P3306 -Dsit_cb_dep_batch < /home/ftpuser/tmp_dep_batch_truncate.sql
    #mysql -h 10.245.1.227 -ucb_dep_batch -pcb_dep_batch -P3306 -Dsit_cb_dep_batch < /home/ftpuser/tmp_dep_batch_create.sql
    mysql -h 10.245.1.227 -ucb_dep_batch -pcb_dep_batch -P3306 -Dsit_cb_dep_batch < /home/ftpuser/tmp_dep_batch_init.sql

    echo "dep_batch exec success!"
}

func_loan_batch()
{
    #将脚本中的truncate语句替换成delete语句
    sed -i 's/truncate table/delete from/Ig' /home/ftpuser/tmp_loan_batch_truncate.sql
    mysql -h 10.245.1.227 -ucb_loan_batch -pcb_loan_batch -P3306 -Dsit_cb_loan_batch < /home/ftpuser/tmp_loan_batch_truncate.sql
    #mysql -h 10.245.1.227 -ucb_loan_batch -pcb_loan_batch -P3306 -Dsit_cb_loan_batch < /home/ftpuser/tmp_loan_batch_create.sql
    mysql -h 10.245.1.227 -ucb_loan_batch -pcb_loan_batch -P3306 -Dsit_cb_loan_batch < /home/ftpuser/tmp_loan_batch_init.sql

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
func_loan 
func_ae 
func_dep 
#wait
