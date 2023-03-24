# Linux コマンド

Linux には命令文を記述したり、スプリクトを組むときに使用する「bash」があります。<br>
1 行目の「#!/usr/bin/bash」は bash を使用したシェルスクリプトであることを意味しています。<br>
2 行目では実行する命令文を記述します。最後に「exit 0」で bash を終了します。<br>
引数の 0 は正常に終了することを意味します。<br>
異常終了時は 1 を返します。<br>

```
#!/usr/bin/bash

#ここはコメントです。
echo "Hello World!!"

#処理を終了します。
exit 0
```

## 変数定義

変数は大文字小文字や数字などの半角英数字やアンダーバー(\_)が使えます。
変数に値を代入するときは「変数=値」のように記述します。「=」の前後に空白を入れるとエラーになるので注意しましょう。
また、変数にアクセスするときは「${変数}」のように変数名の前に「$」を付けて、変数を「{}」で囲む必要があります。

変数は基本的にグローバル変数である。同じプロセス内で参照・変更ができる。
関数内において local 宣言された変数はその関数内でのみ有効で、関数外には持ち出されない。

```
#数字
num=1
#文字列
str="Hello"
#文字列でパスも使えます。
path="/Users/reiwatarou/Documents/AppProject/Linux"

#出力
echo ${num}
echo ${str}
echo ${path}
```

## 各コマンド

Linux コマンド一覧

### 現在のディレクトリを確認

pwd コマンド

```
#コマンド
pwd

#結果
/Users/tsuchiyakatsumi/Documents/AppProject/Linux
```

### ファイルを一覧表示

ls コマンド
「ls ディレクトリ名」でディレクトリ内にあるファイルの一覧を表示します。
「ls」のみで実行した場合はカレントディレクトリ内にあるファイルの一覧を表示します。

-l オプションを利用すると各ファイルの更新時間や権限が見れます。

```
ls -l /Users/tsuchiyakatsumi/Documents/AppProject/Linux
total 8
-rw-r--r--  1 tsuchiyakatsumi  staff  1694  9 24 00:18 Linux.md
drwxr-xr-x  3 tsuchiyakatsumi  staff    96  9 24 00:01 bash
drwxr-xr-x  2 tsuchiyakatsumi  staff    64  9 23 18:42 test
```

### 作業するディレクトリを移動する

cd コマンド

```
#現在のディレクトリ内のworkディレクトリへ移動する
cd work

#一つ上の階層のディレクトリに移動
cd ..
```

### ファイル、フォルダ作成

touch コマンド、mkdir コマンド

```
#ファイル作成
touch ファイル名

# フォルダ作成
mkdir フォルダ名
```

### ファイル編集

vi コマンド<br>
編集する場合には i をクリック。
編集後は esc ボタンクリック後に、:wq で保存。:q だと保存しない。

```
id username rank age
1 tarou s  22
2 yuki a 23
3 takumi 21

#編集中はインサートモードで以下表示が出る。
-- INSERT --
```

### ファイルの中身を確認

cat コマンド<br>
中身を確認。

```
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
id username rank age
1 tarou s  22
2 yuki a 23
3 takumi 21
```

### コピーを作成

cp コマンド<br>
-r でディレクトリをコピーする。配下にサブディレクトリがある場合は、そのディレクトリごとコピーされる。

```
cp /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/shohinTable

#-rオプション
cp -r /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/ /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test2/
```

### テキストファイルの行数や単語数を数える

wc コマンド<br>
指定したテキストファイルの行数、単語数、バイト数の順で表示される

```
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
id username rank age
1 tarou s  22
2 yuki a 23
3 takumi 21

cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | wc
4      15      59

#-lオプションで行数のみ表示
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | wc -l
4
```

### 先頭から数行を表示

head コマンド

```
# headコマンドはデフォルト10行表示
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | head
id username rank age
1 tarou s  22
2 yuki a 23
3 takumi 21

#行数指定
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | head -2
id username rank age
1 tarou s  22
```

### 最終行から数行を表示

tail コマンド

```
# tailコマンドはデフォルト10行表示
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | tail
4 tomoki a 33
5 rina a 25
6 genki a 20
7 daiki b 28
8 akira b 22
9 ayaka b 25
10 naoki c 42
11 hanako c 45
12 kana c 34
13 kaito c 30

#行数指定
cat /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | tail -2
12 kana c 34
13 kaito c 30
```

### ファイル検索

find コマンド

```
find /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
/Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable

#find 検索先 -name ファイル名
find /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/ -name user*
/Users/tsuchiyakatsumi/Documents/AppProject/Linux/test//userTable
```

### ファイル中の文字列

grep コマンド

```
#grep 検索正規表現 ファイル名
grep tarou /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/*
/Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable:1 tarou s  22
```

### 置換

sed コマンド

```
#小文字のbをBに置き換える
sed -e 's/b/B/g' /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
id username rank age
1 tarou s  22
2 yuki s 23
3 takumi s 21
4 tomoki a 33
5 rina a 25
6 genki a 20
7 daiki B 28
8 akira B 22
9 ayaka B 25
10 naoki c 42
11 hanako c 45
12 kana c 34
13 kaito c 30

#指定行の削除
sed -e 1d /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
1 tarou s  22
2 yuki s 23
3 takumi s 21
4 tomoki a 33
5 rina a 25
6 genki a 20
7 daiki b 28
8 akira b 22
9 ayaka b 25
10 naoki c 42
11 hanako c 45
12 kana c 34
13 kaito c 30

```

### 行単位で並び変え

sort コマンド

```
#テーブルデータなどの場合、以下のように使うとヘッダーが残ってしまう。
sort /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable
1 tarou s  22
10 naoki c 42
11 hanako c 45
12 kana c 34
13 kaito c 30
2 yuki s 23
3 takumi s 21
4 tomoki a 33
5 rina a 25
6 genki a 20
7 daiki b 28
8 akira b 22
9 ayaka b 25
id username rank age

#ヘッダーを削除してから、sortを行う。
#-nオプションで数値で並び替え
sed -e 1d /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | sort -n
1 tarou s  22
2 yuki s 23
3 takumi s 21
4 tomoki a 33
5 rina a 25
6 genki a 20
7 daiki b 28
8 akira b 22
9 ayaka b 25
10 naoki c 42
11 hanako c 45
12 kana c 34
13 kaito c 30

#sort -k 並べ替えに使う列番号 -t 区切りに使うキー文字 ファイル名
#年齢で並び替えを行う。
sed -e 1d /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/userTable | sort -k 4 -t " "
6 genki a 20
3 takumi s 21
1 tarou s 22
8 akira b 22
2 yuki s 23
5 rina a 25
9 ayaka b 25
7 daiki b 28
13 kaito c 30
4 tomoki a 33
12 kana c 34
10 naoki c 42
11 hanako c 45
```

### 行単位で並び変え

join コマンド

```
#内部結合
#出力するフィールドを１つめのファイルの１つめのフィールドと２つめのファイルの３つめのフィールドとを指定しファイル
join -o '1.1,1.2,1.3,1.4,2.2' -1 4 -2 1 /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/shohinTable /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/soukoTable


#外部結合
#-a で指定したファイル番号
join -o '1.1,1.2,1.3,1.4,2.2' -a 1 -1 4 -2 1 /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/shohinTable /Users/tsuchiyakatsumi/Documents/AppProject/Linux/test/soukoTable
```
