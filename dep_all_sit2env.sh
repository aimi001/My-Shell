#本脚本用于将脚本同步到DEV、SIT2环境的存款系统库

func_dev()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.165 dep dep cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "dev error!"
        exit 1
    fi
    echo "dev exec success!"
}

func_sit()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.245.1.165 dep dep sit_cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "sit error!"
        exit 1
    fi
    echo "sit exec success!"
}

func_uat()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.247.1.20 root ITfin1020 cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "uat error!"
        exit 1
    fi
    echo "uat exec success!"
}


func_sit2()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.247.1.20 root ITfin1020 sit2_cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "sit2 error!"
        exit 1
    fi
    echo "sit2 exec success!"
}

func_batch()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.248.1.93 root itfin1020 cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "batch error!"
        exit 1
    fi
    echo "batch exec success!"
}

func_prod()
{
    sh /home/ftpuser/sbin/good_batch_online.sh 10.2.8.95 cb_dep_app@dep_tenant 3kwNKzl5 cb_dep /home/ftpuser/tmp_dep.sql
    if [ $? -ne 0 ];then
        echo "prod error!"
        exit 1
    fi
    echo "prod exec success!"
}


func_dev 
func_sit2

