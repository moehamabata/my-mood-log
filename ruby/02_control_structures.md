## if文の書き方
```ruby
if  条件式
　処理
end
```

```ruby
if 点数が90より高い
　puts "よくできました"
end
```

メモ：
- if文は「もし〜ならば、◯◯を行う」という条件分岐である
- ifの後に条件を書き、それが成り立つ場合に処理を実行する


## if文の条件

**1 条件が成立する時**

```ruby
Score＝97
if  score > 90
　puts  "よくできました"
end
```

```ruby
"よくできました"
```

メモ：
- Score > 90の部分は変数scoreの値が90より大きい
- Score＝97なので条件が成立している


**2 条件が成立しない時**

```ruby
Score＝73
if  score > 90
　puts  "よくできました"
end
```

```ruby
何も表示がされない
```

メモ：
- if文の条件式が成り立たないと条件式は成立せず処理は実行されない


## 真偽値(true&false)
```ruby
score ＝ 97
puts  score > 90
```

```ruby
true
```

```ruby
Score ＝ 73
puts  score > 90
```

```ruby
false
```

メモ：
- 真偽値には、trueとfalseが存在している
- 成り立てばtrue
- 成り立たなければfalse

## 比較演算子
①
```ruby
score ＝ 97
puts  score < 60
puts  score <＝ 97
puts  score > 97
puts  score ＝> 100
```
```ruby
false
true
false
false
```

メモ：
-  a < b  ＝ aの方がbより小さいときtrue
- a <＝ b ＝ aの方が小さいときまたは等しいときtrue
-  a > b  ＝ aの方が大きいときtrue
- a ＝> b ＝ aの方が大きいときまたは等しいときtrue

②
```ruby
score ＝ 80
puts  score  ＝＝ 90
puts  score  !＝ 75
name  ＝  "Alice"
puts  name  ＝＝  "Alice"
puts  name  !＝  "Alice"
```
```ruby
false
true
true
false
```

メモ：
- a ＝＝ b → aとbが等しいときtrue
- a !＝ b  → aとbが異なるとき


## else

```ruby
if  条件式
　処理
else
　処理
end
```

```ruby
score ＝ 100
if  score ＝＝ 100
　puts  "満点です"
else
　puts "満点ではありません"
end
```

メモ：
- elseは「もし◯◯なら●●を行う、そうでなければ■■を行う」という処理ができる
- if文の条件がfalseの場合、elseの処理が実行される


## elsif

```ruby
if  条件式
　処理
elsif  条件式2
　処理
else
　処理
end
```

```ruby
score ＝ 88
if  score > 85
　puts  "よくできました"
elsif  score > 70
　puts  "まずまずです"
else
　puts "がんばりましょう"
end
```

```ruby
よくできました
```

メモ：
- elsifは「もし●●だったら◯◯を行う、そうでなくもし▲▲であれば△△を行う、いずれでもなく■■であれば□□を行う」という条件分岐ができる
- 複数の条件に合致したとしても、最初の条件にのみ実行される

## かつ(&&)
```ruby
X = 10
X > 20 && X < 30 
```
```ruby
false
```
```ruby
X = 25
X > 20 && X < 30
```
```ruby
true
```
メモ：
- 「かつ」は「&&」で表す
-  条件1 && 条件2は、条件1かつ2という意味で、複数の条件が全てtrueならtrueになる

## または ||
```ruby
X = 10
X > 20 || X < 30 
```
```ruby
X = 25
X > 20 || X < 30
```
メモ：
- 「または」は「||」で表す
- 「条件1 || 条件2」は「条件1または条件2」という意味です
- 複数の条件のうち一つでもtrueならtrueになる

まとめ：
- ifの条件分岐は、条件が成り立つ時に処理が実行される
- また、成り立たない場合は処理が実行されない
- if → elsif → elseの順番
- 真偽値は成り立てばtrue、成り立たなければfalse
- 比較演算子で「＝」が入ると等しいときが条件に加わる
- 「かつ」は複数の条件がtrueの場合のみtrue
- 「または」は複数条件のうち一つでもtrueならtrue

学んだこと：
- 条件分岐の種類が多いこと。やややこしいものと判別できるようにしておく。
- 複数の条件に当てはまったとしても有効なのは最初の条件

気づき・反省：
- elsifをelseifと書いてしまったことがあったので気をつける
- 比較演算子の使い方を混同しないようにする