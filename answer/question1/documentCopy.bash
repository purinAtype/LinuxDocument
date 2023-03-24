#!/usr/bin/bash

#問題
#①本日の日付がファイル名にある物を、本日のディレクトリを作成し、格納する。

#回答
#①本日の日付がファイル名にある物を、本日のディレクトリを作成し、格納する。

# 今月の取得
today=$(date +"%Y%m%d")
#インプットパス(確認したいフォルダパス)
inputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/doc/question1"
#アウトプットパス(出力ファイルを出す場所)
outputpath="/Users/tsuchiyakatsumi/Documents/AppProject/Linux/LinuxDocument/result/result1"

#当日フォルダ作成
#本日の日付のディレクトリが存在しない場合、ディレクトリを作成し、本日日付のファイルをコピーします。
if [ -d "${outputpath}/$today" ]; then
    find ${inputpath} -name *${today}* | xargs -I {} cp {} $outputpath/$today/
else
    mkdir "${outputpath}/$today"
    find ${inputpath} -name *${today}* | xargs -I {} cp {} $outputpath/$today/
fi





