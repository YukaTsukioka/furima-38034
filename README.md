# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many items
has_many orders

## items テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------------------------  |
| item              | string     | null: false                    |
| description       | text       | null: false                    |
| details_category  | text       | null: false                    |
| details_condition | integer    | null: false                    |
| shipping_charges  | integer    | null: false                    |
| shipping_area     | integer    | null: false                    |
| days_to_ship      | integer    | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association
belong_to users
has_one orders


## orders テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |


### Association
belong_to user
belong_to items
has_one order_details



## orders_details テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |
| phone number | integer    | null: false                    |


### Association
belong_to order
