#判断输入参数是否正确
if [ $# -ne 6 ];then
    echo "输入参数有误，请重新输入！"
    echo "正确的使用方法："
    echo "$0 数据库名 数据库用户名  数据库用户密码 机构号码 产品大类代码  产品小类代码"
    exit 1
fi

#cat /home/ftpuser/sbin/tablist.txt | while read line
cat /home/ftpuser/sbin/shbak/tablist.txt | while read line
do
    if [ $line == "cb_supp_mjmiacctrtxnlimit" ];then
        echo "delete from $line where BRANCHNBR='$4' and MJACCTTYPCD='$5' and MJMIACCTTYPCD='$6';" >> del_product.sql
    else
        echo "delete from $line where BRANCHNBR='$4' and MJACCTTYPCD='$5' and MIACCTTYPCD='$6';" >> del_product.sql
    fi
done

#mysql -h10.248.1.100 -u$2 -p$3 -D$1 < del_product.sql
#rm -rf /home/ftpuser/sbin/del_product.sql

echo "success!"
