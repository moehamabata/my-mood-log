## Controller（コントローラー）
- アプリの司令塔
- ユーザーのリクエストを受け取る
- データを渡すようにModelへ依頼し、そのデータをViewに渡すといったような橋渡しの役割もある
- 「リクエストを受けて、どのモデルを使って、どのビューを返すか」を決めている

**1. コントローラー作成の基本構文**
```bush
bin/rails generate controller Controller名 アクション1 アクション2...
```
メモ：
- Controller名の後に入力するアクションは複数で指定することが可能
- 作成するには上記のコマンドを使用すること

**2. 全体構造**
```ruby
class PostsController < ApplicationController

# 一覧を表示
  def index
  end

# 詳細を表示
  def show
  end

# 新規投稿フォーム
  def new
  end

# 投稿保存
  def create
  end


# 編集フォーム
  def edit
  end

# 更新処理
  def edit
  end

# 更新処理
  def update
  end

# 削除
  def destroy
  end
end

①class PostsController < ApplicationController
メモ：
- ApplicationControllerはRailsの基本機能を全て受け継ぐパス
- PostsControllerは、Post（投稿）専用の司令塔
- 継承して初めて司令塔としてきちんと動くようになる
- RailsのControllerとしては機能しない

継承されることで使用できる機能や設定：
- 認証機能(ログインしているかチェック)
- フラッシュメッセージの表示
- 共通のbefore_action
- Rescue（例外処理）の共益化

継承しなかったらどうなるか：
```ruby
class PostsController
```
メモ：
- ApplicationControllerを継承していないと、Rainsの便利機能が全て使えない
- 継承しなかったら「ただのクラス」になる
- 司令塔として動かすのに必要なメソッドも継承されない
- ルーティングで呼んでも正しく動かないことが多い

②def index
メモ：
- 投稿一覧ページを表示するメソッド
- URL例：/posts/1(ID=1の投稿)
- Modelから１件取得してViewに渡す

```ruby
@post=Post.find(params[:id])
```

③def show
メモ：
- 投稿詳細を表示するメソッド

④def new
メモ：
- 新規投稿フォームを表示するメソッド
- まだ保存はしていない
- Viewに空のPostインスタンスを渡すことが多い

```ruby
@posy=Post.new
```

⑤def create
メモ：
- 新規投稿を保存するメソッド
- フォームの送信後に呼ばれる
- 実際にModelに保存する処理

```ruby
@post=Post.new(post_params)
if @post.save
  redirect_to@post
else
  render :new
end
```
メモ：
- 成功したら詳細ページ
- 失敗したらフォームに戻る
  
⑥def edit
メモ：
- 投稿の編集ページを表示するメソッド
- URL例：/posts/1/edit
- 既存の投稿データを取得してフォームに表示

```ruby
@post=Post.find(params[:d])
```

⑦def update
メモ：
- 投稿を更新するメソッド
- 編集フォームの送信後に呼ばれる
- Modelのデータを更新する処理

```ruby
@post=Post.find(params[:id])
if @post.update(post_params)
  redeirect_to @post
else
  render :edit
end
```
メモ：
- 成功すれば詳細ページ
- 失敗すれば編集フォームに戻る

⑧def destroy
メモ：
- 投稿を削除するメソッド
- Modelから１件削除して一覧ページにリダイレクト

```ruby
@post=Post.find(params[:id])
@post.destroy
  redirect_to posts_path
```



private

#strong parameters(安全に受け取るための設定)
  def post_params
  parames.require(:post).permit(:tittle,:content)
  end
end
```
メモ：
- PostsControllerは、投稿（Post）に関する処理を担当するクラス

学んだこと：
- URLは、ユーザー（ブラウザ）がどのページに行きたいかを表す住所のようなもの
- 条件分岐やパラメータ処理やエラー処理など、考えるロジックが多く、頭を使う部分でもある
- メソッドの使い分けのポイントは今のアクションの目的である
- URLの用途＝アクションに適切なメソッド

気づき・反省：
- テストをしっかり書かないと、バグが出やすい箇所でもある
- どのメソッドがいいかをしっかりと見極めることが大事
- Railsでは、URLを見て「どの処理をするか」を決めている