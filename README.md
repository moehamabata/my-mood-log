## My Mood Log
日々の感情を記録し、自分の心の変化を可視するアプリです。

## サービスの概要
忙しい毎日の中で、自分が「今、どう感じているか」をシンプルに記録。
過去のログも振り返ることで、メンタルヘルスの維持をサポートします。

## 使用技術
・Backend: Ruby3. / Ruby on Rails 7.2.2
・Database：PostgreSQL
・Test：Test：RSpec (System Spec / Request Spec)
・Deployment：Render
・Environment：MacBook Pro

## 主な記録
・感情の記録（CRUD）：5段階のアイコンやテキストでその日の気分を保存。
・ダッシュボード：過去のログを一覧や詳細の表示
・レスポンシブ対応：スマートフォンからもスムーズに記録可能。

## こだわったポイント
・テストの徹底：RSpec を用い、正常系・異常系ともにシステムテストを記述。堅牢なコードを意識しました。
・デプロイ管理：GitHub と Render を連携させ、継続的なデプロイ環境を構築しました。

## ローカルでの起動方法
git clone https://github.com/moehabata/my-mood-log.git
cd my-mood-log
bundle install
rails db:create db:migrate
bin/dev