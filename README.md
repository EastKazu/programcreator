# アプリ名： ProgramCreator

## 概要
このアプリケーションは、オーケストラの演奏会プログラムを効率的に作成する補助ツールです。メインとなる曲の決定後に残りの曲を選ぶ作業があります。この時、団員数や団員一人当たりの参加曲数によって曲の絞り込みが必要です。この絞り込みの作業を補助し、曲の組み合わせを提案します。

## URL

###########################

## 利用方法
#############################

## データベース設計

### 1. `pieces`（曲）

| Column             | Type       | Explain         | Options      |
|----------------|-----------|----------------|----------------|
| `piece_name`   | test      | 曲名           |null: false          |
| `composer_id`  | integer   | 作曲者         |null: false          |
| `duration`     | integer   | 演奏時間（分）  |null: false          |
| `genre_id`     | integer   | ジャンル        |null: false          |
| `year_composed`| integer   | 作曲年          |null: false          |

#### Association

- has_many :pieces_instruments


#### 2. `instruments`（楽器）

| Column             | Type       | Explain         | Options      |
|--------------|-----------|----------------|----------------|
| `instrument_name`       | text      | 楽器名       |null: false   |
#### Association

- has_many :pieces_instruments


#### 3. `piece_instruments`（中間テーブル）

| Column             | Type       | Explain                                | Options      |
|-----------------|-----------|------------------------------------------|----------------|
| `piece_id`      | integer   | 曲のID（外部キー、`pieces.id`を参照）        |null: false          |
| `instrument_id` | integer   | 楽器のID（外部キー、`instruments.id`を参照） |null: false          |
| `quantity`      | integer   | 人数                                       |null: false          |

#### Association

- belongs_to :piece
- belongs_to :instrument