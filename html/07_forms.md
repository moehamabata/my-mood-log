## フォームのレイアウト

**1. <input>と<textarea>**
```html
<form>
  <p>input</p>
  <input>
  <p>textarea要素</p>
  <textarea></textarea>
</form>
```

メモ：
- 〈input〉要素は1行のテキスト入力を受け取るための要素。終了タグは不要。
- 　type属性を指定することが可能
- 〈textarea〉要素は複数行のテキスト入力を受け取るための要素。終了タグは必要。

**2. 送信ボタンを作ろう**
```html
<input type="submit">
```

まとめ：
- <input>要素にはtype属性を指定することができる

気づき・反省点：
- 終了タグが必要か不要なのかを知識として頭に入れておくこと