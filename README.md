# アプリ名
ProgramCreator


# 概要
このアプリケーションは、オーケストラの演奏会プログラムを効率的に作成する補助ツールです。  
団員数や団員一人当たりの参加曲数によって曲組み合わせを検索することができます。


# URL
https://programcreator.onrender.com/


# 利用方法
## 楽曲の組み合わせ検索機能
1. トップページ右上または下部の「SEARCH」ボタンから検索ページに遷移して条件に合う曲の組み合わせを検索する  
    - フォームに各楽器の人数と使用回数を入力して検索ボタンを押す。  
    - より絞り込みたい場合は左側のフォームから作曲者、ジャンル、国、作曲年の条件を付けて検索可能。  
2. 検索結果から各曲の曲名をクリックすることで各曲の詳細ページに移動することができる。  
## 楽曲一覧表示機能
1. トップページ右上または下部の「LIST」ボタンから現在登録されている曲の一覧を確認することがでる。


# アプリケーションを作成した背景
学生時代から複数のアマチュアオーケストラ団体に所属し運営にも携わってきましたが、どの団体でも演奏会の曲選びが難航しておりました。その要因の一つに、各楽器の団員数にばらつきがあり、人数の制約から演奏不可能な曲があることや、逆に演奏会を通して一度も演奏機会がない人が出てしまう曲の組み合わせを選べないという点があります。  
この問題を解決するために、各楽器の団員数の条件に基づき、演奏可能な曲の組み合わせを検索できる機能を持ったアプリケーションの開発を行うことにしました。


# 実装した機能
## 楽曲の組み合わせ検索機能  
1. フォームに各楽器の人数とその最低、最大の使用回数を入力して曲の組み合わせを検索する
[![Image from Gyazo](https://i.gyazo.com/701229f5fb1e30379c730598a33dc30f.gif)](https://gyazo.com/701229f5fb1e30379c730598a33dc30f)
2. さらに曲を絞りたい場合は作曲家、ジャンル、国、作曲年の条件を追加して検索できる
[![Image from Gyazo](https://i.gyazo.com/c5ae83b407e7b2a7cba1fdc8f1f7b691.gif)](https://gyazo.com/c5ae83b407e7b2a7cba1fdc8f1f7b691)
3. 検索結果画面の各曲の名前をクリックすることで曲の詳細ページに移動する
[![Image from Gyazo](https://i.gyazo.com/1bb71e860c8533251971b22955d6e0ff.gif)](https://gyazo.com/1bb71e860c8533251971b22955d6e0ff)

## 登録楽曲一覧表示機能
1. 「LIST」ボタンから楽曲一覧ページに遷移する
[![Image from Gyazo](https://i.gyazo.com/16f22f6ff7d62628c6150c57c3454eb6.gif)](https://gyazo.com/16f22f6ff7d62628c6150c57c3454eb6)


# 実装予定の機能
1. 検索機能の条件拡充  
    - 3曲以上の曲の組み合わせを検索できるようにする
    - すでに決定している曲がある場合もあるため、事前に決定曲を登録できるようにする
2. ユーザー機能を追加
    - ユーザー機能を追加して検索結果を保存できるようにする

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2fc8c0063e11e0f49e2b0c32712f8458.png)](https://gyazo.com/2fc8c0063e11e0f49e2b0c32712f8458)

### 1. pieces（曲）
| Column             | Type       | Explain         | Options      |
|----------------|-----------|----------------|----------------|
| `piece_name`   | test      | 曲名           |null: false          |
| `composer_id`  | integer   | 作曲者         |null: false          |
| `duration`     | integer   | 演奏時間（分）  |null: false          |
| `genre_id`     | integer   | ジャンル        |null: false          |
| `year_composed`| integer   | 作曲年          |null: false          |
| `country_id`   | integer   | 国             |null: false          |
| `remarks`      | text      | 備考           |                     |
#### Association
- has_many :pieces_instruments

### 2. instruments（楽器）
| Column            | Type     | Explain | Options      |
|-------------------|----------|---------|--------------|
| `instrument_name` | text     | 楽器名   |null: false   |
#### Association
- has_many :pieces_instruments

### 3. piece_instruments（中間テーブル）
| Column          | Type      | Explain      | Options      |
|-----------------|-----------|--------------|--------------|
| `piece_id`      | integer   | 曲のID       |null: false   |
| `instrument_id` | integer   | 楽器のID     |null: false   |eaver
| `quantity`      | integer   | 人数         |null: false   |
#### Association
- belongs_to :piece
- belongs_to :instrument


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/86ece8afb6aaa2ca3555953b91688494.png)](https://gyazo.com/86ece8afb6aaa2ca3555953b91688494)


# 開発環境
### 使用言語(マークアップ言語、データベース言語を含む)
- Ruby
- HTML
- CSS
- JavaScript
- SQL

### フレームワーク
- Ruby on Rails

### 使用Gem
- ransack

### その他使用サービス
- Visual Studio Code
- DBeaver
- Git
- GitHub
- Render
- TablePlus
- ChatGPT


# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/EastKazu/programcreator.git  
% cd original-app/programcreator  
% bundle install  
% rails db:create  
% rails db:migrate

# 工夫したポイント
- 検索フォームに空白があっても検索可能にしたこと。
- 曲の順番が異なるだけの重複した検索結果が出ないようにしたこと。

# 改善点
- スマートフォンに対応したレスポンシブデザインを実装する。
- SQLでの条件式が複雑になっているため、リファクタリングを行う。

# 制作時間
SQLの学習を含めて約3週間
