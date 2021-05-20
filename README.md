# アプリケーション名
Plog

## アプリケーション概要
プロテイン専門のレビューアプリです。  
ユーザーはお気に入りのプロテインを投稿したり発見できます。

## 作成した目的
手軽にお気に入りのプロテインを共有したり見つけられるアプリが作りたいと思いました。
そのため、初めてのユーザーでもプロテインに興味がもてる設計にしました。

## 使い方

### トップ画像
[![Image from Gyazo](https://i.gyazo.com/87645c3308693e95bce4b4631d991fda.gif)](https://gyazo.com/87645c3308693e95bce4b4631d991fda)
トップ画面から「検索」「投稿された商品の表示」が可能です。またログイン後はトップページから商品の投稿が可能になります。

### 商品詳細画面
[![Image from Gyazo](https://i.gyazo.com/c15c5f740a50e7d4541636222960ec20.gif)](https://gyazo.com/c15c5f740a50e7d4541636222960ec20)
気になる商品をクリックすると詳細画面に遷移します。「いいね」をクリックするとお気に入りとして保存がされます。また商品に対してのコメントも可能です。

### 商品投稿画面
[![Image from Gyazo](https://i.gyazo.com/3a830b3ff4ad5925515384e449981f2d.gif)](https://gyazo.com/3a830b3ff4ad5925515384e449981f2d)
トップページのサイドバーにある投稿ボタンをクリックすると、商品投稿画面に遷移します。各項目を入力すると投稿が可能です。

### URL
https://www.protein-app.com/

## 使用技術
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- HTML/CSS
- JavaScript
- jQuery
- MySQL
- Rspec
- Capistrano

## インフラ
- AWS
    - EC2
    - S3

## 機能一覧
- ユーザー登録/ログイン機能
- ゲストログイン機能
- 商品投稿機能
- 商品一覧表示機能
- 商品詳細機能
- 商品削除機能
- 商品編集機能
- コメント機能
- 検索機能
- お気に入り機能

## テスト
* Rspec
  * 単体テスト(model)
  * 結合テスト(system)


# テーブル設計

## usersテーブル
|Column | Type | Options |
|----------| --------| ------------ |
| nickname| string | null:  false  |
| email     | string | null:  false ,   unique: true |
| encrypted_password | string | null:  false     |
| profile   | text | null:  false     |


### Association
- has_many :items
- has_many :comments



## itemsテーブル
|Column | Type | Options |
|----------| --------| ------------ |
| name  | string | null:  false    |
| taste   | string | null:  false    |
| price  | integer | null:  false    |
| protein | integer | null:  false    |
| lipid    | integer | null:  false     |
| amount | integer | null:  false    |
|impression | text | null:  false    |
| user | references | null:false, foreign_key: true |


### Association
- belongs_to :user
- has_many :comments


## comments
|Column | Type | Options |
|----------| --------| ------------ |
| text  | text |  null:  false |
| user | references | null:false, foreign_key: true |
| item | references | null:false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item


## Bookmark
|Column | Type | Options |
|----------| --------| ------------ |
| user | references | null:false, foreign_key: true |
| item | references | null:false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item