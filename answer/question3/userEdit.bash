#!/usr/bin/bash

#③userTableファイルに自身のユーザー情報を追加し、result3配下に出力。

#変数定義
inputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/doc/question3"
outputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/result/result3"

#自身のユーザー情報を定義
myName="katsumi"
myRank="s"
myAge="26"

#userTableに存在する一番大きい数字のIdに+1し、追加するデータのIDとして使用する。
myId=`cat $inputpath/userTable | sort -n -r -k 1 -t , | awk -F"," '{print $1}' | head -1 | awk '{print $1 + 1}'`

#自身のデータを,区切りで連結する。
myData=`echo "$myId,$myName,$myRank,$myAge"`

#userTableoutputpath配下にコピーし、自身のデータを追加する。
cp $inputpath/userTable $outputpath/userResult
echo $myData >> $outputpath/userResult