### セマンティック指定

**1 セマンティックを設定する**
```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>セマンティックHTMLの例</title>
  <style>
    body {
      font-family: sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
    }
    header, footer {
      background-color: #f2f2f2;
      padding: 1em;
    }
    nav ul {
      list-style: none;
      padding: 0;
      display: flex;
      gap: 1em;
    }
    main {
      padding: 1em;
    }
    article {
      margin-bottom: 2em;
      border-bottom: 1px solid #ccc;
      padding-bottom: 1em;
    }
    aside {
      background-color: #f9f9f9;
      padding: 1em;
      margin-top: 2em;
    }
  </style>
</head>
<body>
```

```html
  <header>
    <h1>セマンティックなWebサイト</h1>
    <nav>
      <ul>
        <li><a href="#">ホーム</a></li>
        <li><a href="#">ブログ</a></li>
        <li><a href="#">お問い合わせ</a></li>
      </ul>
    </nav>
  </header>
```

```html
  <main>
    <section>
      <h2>最新の記事</h2>

      <article>
        <h3>HTMLの基礎</h3>
        <p>HTMLとは、Webページを作るためのマークアップ言語です。セマンティックなタグを使うことで、構造が明確になります。</p>
        <p><time datetime="2025-09-01">2025年9月1日</time> に投稿</p>
      </article>

      <article>
        <h3>CSSでスタイリング</h3>
        <p>CSSを使えば、HTMLで作った構造にデザインを加えることができます。</p>
        <p><time datetime="2025-09-05">2025年9月5日</time> に投稿</p>
      </article>
    </section>

    <aside>
      <h2>人気の記事</h2>
      <ul>
        <li><a href="#">HTMLタグ一覧</a></li>
        <li><a href="#">CSSレイアウト入門</a></li>
      </ul>
    </aside>
  </main>

  <footer>
    <p>&copy; 2025 セマンティックWebサイト</p>
  </footer>

</body>
</html>
```

## セマンティックなHTMLタグ
〈header〉　ページやセクションのヘッダー部分
〈nav〉  ナビゲーションリンクの集合
〈main〉　ページの主たる内容(1ページにつき1つだけ)
〈section〉　ある意味を持ったコンテンツの区切り
〈article〉　独立したコンテンツ(ブログ記事・ニュースなど)
〈aside〉　補足的な情報(サイドバーなど)
〈footter〉　ページやセクションのフッター部分
〈figure〉/〈figcaption〉  画像や図とそのキャプション(説明)をまとめる
〈mark〉　強調表示(ハイライト)部分
〈time〉　日付や時間を表す


メモ：
- セマンティック＝「意味のある」という意味
- タグが「この部分は何の役割を持っているか」を表現しているHTMLのこと
- 他の開発者がコードを読んだときに理解しやすくなり、可動性が上がる
- Googleなどの検索エンジンが内容を正しく理解しやすくなり、検索エンジン最適化に有利となる
- スクリーンリーダーなどが正しくページを読み上げやすくなり、アクセシビリティが向上
- コードの意味が明確になるので、更新や修正がしやすい


## セマンティック vs 非セマンティック
- 〈article〉　　　〈div class＝"article"〉
-  〈nav〉               〈div class＝"nav"〉
- 〈header〉          〈div class＝"header"〉
- 〈footer〉            〈div class＝"footer"〉


まとめ：
- レイアウト目的：〈div〉を使う
- 内容や役割に意味がある場合(この部分はページの中でどんな役割を持っているか)：セマンティックタグを使う
- 1ページに〈main〉は1つだけ(他は複数OK)


気づき・反省点：
- セマンティックは便利だが、だいぶ複雑なので用途をしっかりと確認しておくこと