## Model(モデル)

**1. Modelとは**
- データの保管及び処理を担当
- データベースからデータを取得して返す
- データの整理もやる
- Validationもここで行う

**2. modelコマンドの基本構文**
```bash
rails generate model モデル名
```
メモ：
- こうすることでモデルを作成することができる
  
```bash
rails g model モデル名
```
メモ：
- また、このように省略してもモデルの作成が可能

```bash
rails generate model Post tittle:string content:text
```
メモ：
- これでapp/models/post.rbが作成される
- tittle - 投稿のタイトル名
- content - 本文
- Modelを作成するときは、１文字目を大文字にする
  
**3. app/models/post.rb(モデル本体)**
```ruby
class Post < ApplicationRecord
  validates :title, presence: true
end
```
メモ：
- ApplicationRecord → Railsの基本モデルを継承する部分
- validates → データが正しいかをチェックする
- title → この部分が空だと保存ができない

```ruby
（例）
OK : Post.new(title: "テスト", content: "本文”)
NG : Post.new(title: nil, content: "本文")
```
メモ：
- 前者は”テスト”というタイトルが入っているので保存ができる。
- しかし、後者はnilとなっているので保存ができない。

**4. spec/models/post_spec.rb(モデルのテスト)**
```ruby
require 'rails_helper'
RSpec.describe Post, type: :model do
  it "タイトルがあれば有効"
    post = Post.new(title: "テストタイトル",content: "本文")
    expect(post).to be_valid
  end
  
  it "タイトルがなければ無効" do
    post=Post.new(title: nil,content: "本文")
    expect(post).not_to be_valid
  end
end
```

メモ：
①タイトルがあれば有効
内容：正しいデータなら保存できる
目的：バリデーションが通るかどうかの確認

②タイトルがなければ無効
内容：タイトルなしは保存できない
目的：バリデーションが効いているか確認

補足：
require 'rails_helper'
- Railsのテスト環境を実行できるようにする
RSpec.describe Post
- Postモデルを対象にテストを行う
type: :model
- モデル用テストであることを確認

**5. 実行コマンド**
```bash
bundle exec rspec spec/models/post_spec.rb
```
メモ：
- bundle exec : Gemfileに書かれたRubyのライブラリ（Gem）を使ってコマンドを実行する
- RailsやRspecのバージョンはアプリごとに異なる場合がある
- bundle execをつけることで「このプロジェクトのRspecを使うように」と指示を出している

学んだこと：
- モデルはデータの設計図
- テストは設計図通り動くか確認するチェック
- ModelとViewは直接的にはやり取りを行わない。設計上は Controllerを介する
- Gemfile：Modelコマンドを打つことでtittleとcontentのカラムを持つ

気づき・反省：
- ここでの"post"はデータの設計図であり、Rubyで動く
- 「投稿」というデータをRubyの世界で扱うための設計書
- Modelの役割は幅広いが、書き込む時はModelが指示を出すというとことではない
- よって、認識違いが起こらないようにしておく