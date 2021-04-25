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
