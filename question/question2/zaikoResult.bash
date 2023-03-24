#!/usr/bin/bash

#②在庫ファイルに倉庫コードに紐づく各倉庫名を追加し、outputpath配下にzaikoResultファイルを作成する。

#変数定義
inputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/doc/question2"
outputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/result/result2"
header="shouhin_cd,shouhin_name,price,rank,souko_cd,souko_name"

#outputpath配下にzaikoResultファイルがない場合は作成する。
