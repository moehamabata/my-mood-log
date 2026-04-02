## メソッド

**1. メソッドの定義と呼び出し**
```ruby
def greet
  puts "こんにちは"
end
greet
```

```ruby
こんにちは
```

メモ：
- def メソッド名 で定義する
- 定義したメソッドは メソッド名 で呼び出す
- Rubyは一度定義しないと呼び出せない


**2. 引数を持つメソッド**
```ruby
def greet(name)
  puts "こんにちは、#{name}さん"
end
greet("にんじゃわんこ")
greet("ひつじ仙人")
```
```ruby
こんにちは、にんじゃわんこさん
こんにちは、ひつじ仙人さん
```
メモ：
- メソッド名の後ろに (引数) を書くことで値を渡せる
- #{} を使えば文字列の中に変数や式を埋め込める

**3. 戻り値を持つメソッド**
```ruby
def add(a, b)
  return a + b
end
puts add(3, 4)
```
```ruby
7
```
メモ：
- return を使うと値を返す
- return がない場合は最後に評価された値が戻り値になる

## ブロック

**1. ブロックと each メソッド**
```ruby
names = ["にんじゃわんこ", "ひつじ仙人", "guru"]

names.each do |name|
  puts "こんにちは、#{name}さん"
end
```
```ruby
こんにちは、にんじゃわんこさん
こんにちは、ひつじ仙人さん
こんにちは、guruさん
```
メモ：
- do ~ end がブロック 
- each メソッドは配列の要素を順に取り出してブロックに渡す
- |変数| の部分に要素が入る

```ruby
names = ["chiikawa","Hachiware","Usagi"]
# putsで出力されるのは配列
 puts names
#  配列の要素に対してそれぞれ操作を行う
names.each do |moe|
    # 配列の要素
 puts moe
#  配列に対して再定義する
 names = "moe"
 test = "100"
 puts "コメント"
#  再定義した値を出力
 puts names
end
# 再定義したのはローカル変数としてなので、グローバル変数に変化はない
 puts names
```
```ruby
>_ コンソール
chiikawa
Hachiware
Usagi
chiikawa
コメント
moe
Hachiware
コメント
moe
Usagi
コメント
moe
moe
```
メモ：
- 配列の要素を途中で上書きし、出力することで新しい変数になる
- 元々定義されていた値を再定義することで、変更後のものとして出力される

**2. ブロックを {} で書く**
```ruby
[1, 2, 3].each { |n| puts n * 2 }
```
```ruby
2
4
6
```
メモ：
- 短い処理は {} を使うことが多い
- do ~ end と {} は基本的に同じ意味

**3. ブロック付きメソッドを自作する**
```ruby
def repeat(n)
  n.times do
    yield
  end
end

repeat(3) { puts "Hello!" }
```
```ruby
Hello!
Hello!
Hello!
```
メモ：
- yield は渡されたブロックを実行する
- メソッドにブロックを渡してカスタマイズできる

まとめ：
- メソッドは def ~ end で定義、呼び出しはメソッド名
- 引数で値を受け取り、戻り値を返すことができる
- ブロックは do ~ end や {} で書き、メソッドに処理を渡せる
- each のようにブロックを取るメソッドはRubyでよく使う
- yield を使えば自作メソッドでもブロックを受け取れる

気づき・反省：
- 引数の数を間違えるとエラーになる
- return を忘れると「最後の式の値」が返るので意識する
- ブロックは {} と do ~ end の使い分けに慣れていく