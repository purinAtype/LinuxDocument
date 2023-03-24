#!/usr/bin/bash

#③userTableファイルに自身のユーザー情報を追加し、result3配下に出力。

#変数定義
inputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/doc/question3"
outputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/result/result3"

#自身のユーザー情報を定義
myName=""
myRank=""
myAge=""

#userTableに存在する一番大きい数字のIdに+1し、追加するデータのIDとして使用する。(``内にコマンドを記載し、コマンドの実行結果を変数に代入する)
myId=``

#自身のデータを,区切りで連結する。(``内にコマンドを記載し、コマンドの実行結果を変数に代入する)
myData=``

#userTableoutputpath配下にコピーし、自身のデータを追加する。
