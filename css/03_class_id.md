## classの基本的な使い方
メモ：
- CSSの「class」はWebページのデザインや見た目を作成する


**1. class属性の書き方**
```html
〈div class＝"box"〉こんばんは〈/div〉
```

```css
.box ｛
    color: blue;
    background-color: red;
｝
```


メモ：
- 「class＝"box"」がついた「div」に対して、文字色が青、背景色が赤になる
- CSSでは「. クラス名」でクラスを指定する。先頭にピリオド(.)を置く。


**２: 複数のclassを1つの要素に付ける**

メモ：
- HTML要素1つに対して、複数のCSSルール(class)を同時に適用ができる

```html
〈div class＝"box shadow"〉テキスト〈/div〉
```
メモ：
- 上の〈div〉はboxとshadowという2つのクラスがある

```css
.box ｛
　padding: 20px;
　background-color: red
｝
```
```css
.shadow ｛
    box-shadow: 2px 2px 5px  rgba(0,0,0,0,3);
｝
```
メモ：
- 1つの〈div〉に対して、boxとshadow、2つのスタイルが同時に適用されている
- .boxの背景やパディングの設定、.shadowの影の設定がそれぞれ合致して1つのスタイルになる


まとめ：
- classは複数のHTMLの要素に共通のスタイルを当てたい時に使う
- CSSは「. クラス名」で指定しておく
- 同じ要素に複数のクラスをつけることもできる


気づき・反省：
- クラス名の前にピリオド(.)を入れ忘れないこと