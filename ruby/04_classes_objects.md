## クラス

**1. クラスを定義する**
```ruby
class Dog
end
```
メモ：
- class クラス名 で定義する
- Rubyのクラス名は頭文字を大文字にするのがルール

**2. オブジェクトを生成する**
```ruby
class Dog
end

dog1 = Dog.new
dog2 = Dog.new
```
メモ：
- new メソッドでオブジェクト（インスタンス）を生成
- dog1, dog2 は同じクラスから作られた別々のオブジェクト

**3. インスタンスメソッド**
```ruby
class Dog
  def bark
    puts "ワン！"
  end
end

dog = Dog.new
dog.bark
```
```ruby
ワン！
```
メモ：
- クラスの中で def ~ end を書くとインスタンスメソッド
- オブジェクトごとに呼び出せる

**4. インスタンス変数と初期化**
```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def introduce
    puts "ぼくの名前は#{@name}だよ"
  end
end

dog = Dog.new("ポチ")
dog.introduce
```
```ruby
ぼくの名前はポチだよ
```
メモ：
- initialize はオブジェクト生成時に自動で呼ばれる特別なメソッド
- @変数名 はインスタンス変数（オブジェクトごとに保持されるデータ）

**5. クラスメソッド**
```ruby
class Dog
  def self.info
    puts "犬クラスです"
  end
end

Dog.info
```
```ruby
犬クラスです
```
メモ：
- self.メソッド名 とするとクラスメソッドになる
- クラスに対して直接呼び出す
  
まとめ：
- クラスは設計図、オブジェクトは実体
- initialize で初期化できる
- @変数 でオブジェクトごとにデータを保持できる
- クラスメソッドはオブジェクトではなくクラス自体に属する

気づき・反省：
- クラス名は大文字始まりを忘れやすい
- @ をつけ忘れるとローカル変数になってしまう