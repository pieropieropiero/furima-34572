# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null:false, unique:true |
| encrypted_password | string | null: false |
| family_name  | string | null: false |
| first_name  | string | null: false |
| family_name_kana  | string | null: false |
| first_name_kana  | string | null: false |
| birth_day  | date | null: false |
### Association

- has_many :histories
- has_many :products , through: histories

## products テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| introduction| text | null: false |
| category_id   | integer | null: false |
| status_id   | integer | null: false |
| sent_fee_id   | integer | null: false |
| sent_area_id   | integer | null: false |
| arrival_period_id   | integer | null: false |
| price   | integer | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |



### Association

- belongs_to :user 
- belongs_to :category 
- belongs_to :status 
- belongs_to :sent_fee 
- belongs_to :sent_area 


## 	buyersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| sent_area_id   | integer | null: false |
| city_id   | references | null: false, foreign_key: true |
| address  | string     | null: false                    |
| building_name  | string     |                  |
| phone_number  | string     | null: false                    |
| history   | references | null: false, foreign_key: true |


### Association

- belongs_to :history 

## history テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| product  | references | null: false, foreign_key: true |


- belongs_to :user 
-  belongs_to :product
- has_one  :buyer
