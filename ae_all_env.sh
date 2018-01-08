#本脚本用于将脚本同步到开发、SIT、UAT、批量、生产环境的资产交换系统库

func_dev()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.226 cb_ae cb_ae cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "dev error!"
        exit 1
    fi
    echo "dev exec success!"
}

func_sit()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.226 cb_ae cb_ae sit_cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "sit error!"
        exit 1
    fi
    echo "sit exec success!"
}

func_uat()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.247.1.12 root ITfin1020 cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "uat error!"
        exit 1
    fi
    echo "uat exec success!"
}

func_batch()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.88 root itfin1020 cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "batch error!"
        exit 1
    fi
    echo "batch exec success!"
}

func_prod()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_dep_app@dep_tenant 3kwNKzl5 cb_ae /home/ftpuser/tmp_ae.sql
    if [ $? -ne 0 ];then
        echo "prod error!"
        exit 1
    fi
    echo "prod exec success!"
}


func_dev 
func_sit 
func_uat 
#func_batch 
#func_prod 
#wait

