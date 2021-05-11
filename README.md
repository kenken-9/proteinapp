# アプリケーション名
Plog

# アプリケーション概要
プロテイン専門のレビューアプリです。  
お気に入りのプロテインを投稿したり発見できたりできます。


# 使用技術
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- HTML
- CSS
- javascript
- jQuery
- MySQL
- Heroku
- Rspec

# 機能一覧
- ユーザー登録、ログイン機能
- ゲストログイン機能
- 商品投稿機能
- 商品一覧表示機能
- 商品詳細機能
- 商品削除機能
- 商品編集機能
- コメント機能
- 検索機能
- お気に入り機能

# テスト
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