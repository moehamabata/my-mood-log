## Rubyの標準ライブラリ

**1. 標準ライブラリ**

メモ：
- Rubyに最初から付属している便利な機能集
- require で読み込んで使う

**2. ファイル操作（Fileクラス）**
```ruby
File.open("sample.txt", "w") do |file|
  file.puts "Hello, file!"
end
```
メモ：
- "w" は書き込みモード（上書き）
- do ~ end の中でファイルに書き込み処理を行える
- ブロックを抜けると自動でクローズされる

**3. ファイルを読み込む**
```ruby
File.open("sample.txt", "r") do |file|
  file.each_line do |line|
    puts line
  end
end
```
メモ：
- "r" は読み込みモード
- each_line で1行ずつ読み込める

**4.標準ライブラリを使う例**
```ruby
require "date"

today = Date.today
puts today
```
```ruby
2025-09-16
```
メモ：
- require で標準ライブラリを読み込む
- Date クラスで日付を簡単に扱える

**5. 便利な標準ライブラリ例**

メモ：
- date : 日付操作
- json : JSONの読み書き
- net/http : HTTPリクエスト
- set : 集合データ構造

まとめ：
- 標準ライブラリは require で呼び出す
- Fileクラスでファイル読み書き可能
- date や json などよく使うライブラリがある

気づき・反省：
- ファイルモードの "w" と "r" を混同しやすい
- require を忘れるとエラーになる