# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null:false, unique:true |
| user_password | string | null: false |
| family_name  | string | null: false |
| first_name  | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana  | string | null: false |
| birth_day  | date | null: false |
### Association

- has_many :products dependent: :destroy
- has_many :buyer, through: historys

## product テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name   | string | null: false |
| introduction| string | null: false |
| category   | references | null: false, foreign_key: true |
| status   | references | null: false, foreign_key: true |
| sent_fee   | references | null: false, foreign_key: true |
| sent_area   | references | null: false, foreign_key: true |
| price   | integer | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |



### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :status dependent: :destroy
- belongs_to :sent_fee dependent: :destroy
- belongs_to :sent_area dependent: :destroy


## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture_id   | references | null: false, foreign_key: true |
| city_id   | references | null: false, foreign_key: true |
| address  | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :history dependent: :destroy

## history テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |
| buyer   | references | null: false, foreign_key: true |

- belongs_to :user dependent: :destroy
- has_many :products dependent: :destroy