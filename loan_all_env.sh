#用于同步脚本到UAT、SIT的贷款环境

func_dev()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.223 cb_loan cb_loan cb_loan /home/ftpuser/tmp_loan.sql
   if [ $? -ne 0 ];then
       echo "dev error!"
        exit 1
    fi
    echo "dev exec success!"
}

func_sit()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.223 cb_loan cb_loan sit_cb_loan /home/ftpuser/tmp_loan.sql
    if [ $? -ne 0 ];then
        echo "sit error!"
        exit 1
    fi
    echo "sit exec success!"
}

func_uat()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.247.1.23 root ITfin1020 cb_loan /home/ftpuser/tmp_loan.sql
    if [ $? -ne 0 ];then
        echo "uat error!"
        exit 1
    fi
    echo "uat exec success!"
}

func_batch()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.96 root itfin1020 cb_loan /home/ftpuser/tmp_loan.sql
    if [ $? -ne 0 ];then
        echo "batch error!"
        exit 1
    fi
    echo "batch exec success!"
}

func_prod()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_loan_app@loan_tenant 3kwNKzl5 cb_loan /home/ftpuser/tmp_loan.sql
    if [ $? -ne 0 ];then
        echo "prod error!"
        exit 1
    fi
    echo "prod exec success!"
}


func_uat
func_sit
