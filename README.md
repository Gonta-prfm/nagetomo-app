# README

# テーブル設計

## users テーブル

|    Column     | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| profile       | string | null: false |
| email         | string | null: false |
| password      | string |             |


### Association

- has_many :user_rooms
- has_many :rooms, through: user_rooms
- has_many :messages


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :user_rooms
- has_many :users, through: user_rooms
- has_many :messages

## user_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user