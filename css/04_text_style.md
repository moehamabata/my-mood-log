### CSSのテキストスタイル

```css
.styled-text {
  color: #333;
  font-size: 18px;
  font-family: 'Helvetica', sans-serif;
  font-weight: 600;
  text-align: center;
  letter-spacing: 1px;
  line-height: 1.6;
  text-transform: uppercase;
  text-decoration: underline;
}
```

## 代表的なテキストスタイル用CSSプロパティ
**1 基本のテキストスタイル**
- color → 文字色を指定(例: color: red;)
- font-size→文字の大きさを指定（例: font-size: 16px;）
- font-family→フォントの種類を指定(例: font-family: Arial;)
- font-weight→文字の太さを指定(例: font-weight: bold;)
- font-style→文字のスタイル(例: font-style: italic;)
- text-align→テキストの水平位置(例: text-aligh: center;)

**2 テキストの装飾・効果**
- text-decoration→下線・取消線などを選択(例: text-decoration: underline;)
- text-transform→大文字・小文字の変換(例: text-transform: uppercase;)
- letter-spacing→文字間の感覚を調整(例: letter-spacing: 2px;)
- line-height→行間の高さを指定(例: line-height: 1.5px;)
- word-spacing→単語の感覚を調整(例: word-spacing: 4px;)
- text-shadow→テキストに影をつける(例: text-shadow: 2px 2px shadow;)
- white-space→空白や改行の扱いを指定(例: while-shadow: nowrap;)
- direction→テキストの方向(例: direction: rtl;)


まとめ：
- テキストスタイルを整えることで、読みやすさ・デザイン性が大きく変わる


気づき・反省点：
- 日本語のフォント指定では複数の候補をしておくこと。