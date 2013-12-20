#!/bin/bash
MYDATE=`date +%d/%m/%Y`
MYHOST=`hostname -s`
USER=`whoami`

  tput clear
  cat <<MAYDAY
 _____________________________________________________________________________
  User: $USER           Host: $MYHOST           Date: $MYDATE
 _____________________________________________________________________________
                           A: 创建子目录并复制文件
                           B：文件权限测试
                           C：文件字符转换
                           D：文件总数统计
                           E：文本文件行数统计
                           Q：退出
_____________________________________________________________________________
MAYDAY
while :
do
echo -e -n "请选择：>"  
read choos
    case $choos in
     A) if [ -d 庞荣 ]
         then
            rm -r 庞荣
        fi
        chmod 755 庞荣 `mkdir 庞荣`
        echo -e "目录建立成功！"
        cp file1 庞荣/file1
        cp file2 庞荣/file2
        cat 庞荣/file1
        cat 庞荣/file2
        >庞荣/file1
        >庞荣/file2 
;;
     B)read file
       ls -l $file
;;
     C)for files in file1 file2
       do
         cat $files|tr "[a-z]" "[A-Z]" >$files.UC
         cat $files.UC
       done
;;
     D)num=`ls -Al /dev|grep ^d|wc -l`
       echo "目录文件有：" $num
       nue=`ls -Al /dev|grep ^l|wc -l`
       echo "符号链接文件有：" $nue
;;
     E)read file
       wc -l $file
;;
     Q)exit
       break 
;; 
esac
#read DUMMY
done
