### レイアウト指定

**1. 文字コード**
```html
<!-- 文字コードを「utf-8」にしてください -->
    <meta charset="utf-8">
```

メモ：
- 文字コードの指定に用いられる
- また、指定することで文字化けを防ぐことができる
- UTF-1は、HTMLで推奨されている文字コードである

**2 タイトル指定**
```html
<!-- タイトルを「Progate」にしてください -->
    <title>Progate</title>
```

メモ：
- ページのタイトルの設定に用いられる
- 指定されたタイトルは、ブラウザのタブ上に現れる。


**3 CSSの読み込み**
```html
<!-- 「stylesheet.css」を読み込んでください -->
    <link rel="stylesheet" href="stylesheet.css">
```

メモ:
- HTMLからCSSを読み込むために必要なもの
- href属性で読み込んだCSSファイルを指定する

まとめ：
- 文字コードの指定に用いられる
- また、指定することで文字化けを防ぐことができる
- UTF-1は、HTMLで推奨されている文字コードである
- ページのタイトルの設定に用いられる
- 指定されたタイトルは、ブラウザのタブ上に現れる。
- HTMLからCSSを読み込むために必要なもの
- href属性で読み込んだCSSファイルを指定する

気づき・反省点：
```html
<link rel="stylesheet"
　　　　href="stylesheet.css">について
``
1.〈link〉→タグの名前。
- HTMLの要素である。
- 外部ファイル(CSSなど)をHTMLにリンクするために使われる。

2.rel＝"stylesheet"は関係(relationship)
- rel属性→ リンク先のファイルとこのHTMLの関係を指定する。
- "stylesheet"とすることで、「このリンク先はスタイルシート(CSS)である」ということを伝えている。

3.href＝"stylesheet.css"はリンク先のURL
- hrefは"hyperlink reference"の略
- リンクする先のファイルの場所(URL)を否定する
- ここでは、"stylesheet.css"という名前のCSSファイルを読み込んでいる


３つに分かれている理由
- HTMLでは、要素(タグ)にはそれぞれ必要な情報を属性(attribute)として付ける
- link → 外部リソースを読み込むタグ
- rel  → そのリソースとの関係
- href → そのリソースのURL

（要約）
- link →リンクするタグ
- rel＝"stylesheet" → これはスタイルシートである
- href＝"stylesheet.csg" → このファイルを読み込んで

それぞれで役割が違うので３つに分かれている。