### レイアウト

**1. ボックスモデル**

メモ：
- CSSレイアウトの基本中の基本
  
```css
.box {
  width: 200px;
  height: 100px;
  padding: 10px;
  border: 2px solid black;
  margin: 20px;
  box-sizing: border-box;
}
```

メモ：
- content/padding/border/marginの関係
- 幅・高さの指定（width, height）
- box-sizingの違い（content-box/border-box）


**２. positionプロパティ**
```css
.box {
  position: absolute;
  top: 50px;
  left: 100px;
}
```

メモ：
- static → デフォルト（普通に文書の流れ）
- relative → 元の位置を基準にずらす
- absolute → 親要素を基準に絶対配置
- fixed → 画面に固定
- sticky → スクロールに応じて固定もしくは解除


**3. Flexbox**
```css
.container {
  display: flex;
  justifi-content: space-between;
  align-items: center;
}
```

メモ：
- 1次元レイアウト（横方向か縦方向か）
- align-items → 縦揃え
- justify-content → 横揃え
- align-self → 個別要素の縦揃え


**4. Grid**
```css
.container {
  display: grid;
  grid-template-columns: 1fr 2fr 1fr;
}
```
メモ：
- gap → 行列の隙間
- grid-area → 要素の位置指定