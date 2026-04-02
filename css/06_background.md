### 背景の設定

**1 背景色をつける**
```css
.box ｛
　background-color: blue;
｝
```

**2 背景画像を要素にピッタリ表示**
```css
.box ｛
　backgronud-image: url("bg.jpg");
　background-size: cover;
　background-position: center;
｝
```

 メモ:
- 要素の背景に色や画像を設定するために使う
- まとめ書きでも個別に指定することも可能

まとめ：
- 背景に色をつけたい→background-color
- 背景に画像を使いたい→background-image
- 繰り返しや位置を調整したい→background-repeat, background-position
- 大きさを調整したい→background-size
- 固定背景にしたい→background-attachment
- 一括で書きたい→background


気づき・反省：
- background-imageは、テキストの前に表示されるので、文字の視認性を考慮して色や透明度の調整が必要
