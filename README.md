# README

## アプリケション名  
  NageTomo  

## URL
https://nagetomo-app.herokuapp.com/  

## 概要  
<dl>
  <dt>ユーザー</dt>
    <dd>ユーザー登録機能</dd>
    <dd>ユーザー編集機能</dd>
    <dd>ユーザーフォロー機能</dd>
  <dt>チャット</dt>
    <dd>チャットルーム作成機能</dd>
    <dd>チャットルーム一覧機能</dd>
    <dd>リアルタイムチャット機能</dd>
</dl>

## 制作背景  
現在、ダーツで遊んでいる人の多くが1人で遊んでいます。  
その背景にあるのが、ダーツ場や、ダーツバーが減っておりコミュニケーション機会が減っているからです。  
なので上記の問題を解決するために「NageTomo」アプリケーションを作ろうと思いました。  

## ユーザーログイン情報  
<dl>
  <dt>ユーザー1 情報</dt>
    <dd>メールアドレス: hoge@gmail.com</dd>
    <dd>パスワード: hoge1234</dd>
  <dt>ユーザー2 情報</dt>
    <dd>メールアドレス: test@gmail.com</dd>
    <dd>パスワード: test1234</dd>
</dl>

## DEMO
![demo](https://gyazo.com/165d8f01f546fdbe3fae4e840781e63e/raw)  
![demo](https://gyazo.com/e7d920b2c90c7c7ff1a7dc0d3d7d9d16/raw)  

## 工夫したポイント  
- 双方向通信を使用しているためリアルタイムでチャットができる  
- ユーザーフォロー機能を実装した事でいつでもフォロー、フォロワーが見れる  

## 使用した技術  
- Ruby  2.6.5  
- Rails 6.0.3  

## 実装予定  
- ユーザー検索機能
- ユーザーのプロフィールアイコン設定
- チャットを複数人で行える機能  


# テーブル設計

## users テーブル

|    Column     | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| profile       | string | null: false |
| email         | string | null: false |
| password      | string |             |


### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

- has_many :followins, through: relationships


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

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

## relationships テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| follwer | references | null: false, foreign_key: true |

- has_many :followers, through: passive_relationshops
