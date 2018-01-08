#判断输入参数是否正确
if [ $# -ne 5 ];then
    echo "输入参数有误，请重新输入！"
    echo "正确的使用方法："
    echo "$0 数据库名 数据库用户名  数据库用户密码  产品大类代码  产品小类代码"
    exit 1
fi

rm -rf mjmi_init.sql

cat tablist.txt | while read line
do
    echo "-- $line" >> mjmi_init.sql
    if [ $line == "cb_supp_mjmiacctrtxnlimit" ];then
        mysqldump -h10.245.1.224 --compact --extended-insert=false -u$2 -p$3 $1 $line -c --where "MJACCTTYPCD='$4' and MJMIACCTTYPCD='$5'" | \
        grep -i insert 2>>/dev/null 1>> mjmi_init.sql
    else
        mysqldump -h10.245.1.224 --compact --extended-insert=false -u$2 -p$3 $1 $line -c --where "MJACCTTYPCD='$4' and MIACCTTYPCD='$5'" | \
        grep -i insert 2>>/dev/null 1>> mjmi_init.sql
    fi
    echo >> mjmi_init.sql
done
echo "success!"
