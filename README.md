# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column                 | Type   | Options     |
| --------               | ------ | ----------- |
| nick_name              | string | null: false |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false |
| password__confirmation | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birthday               | date   | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options     |
| --------         | ------     | ----------- |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| postage_id       | integer    | null: false |
| region_id        | integer    | null: false |
| Shipping_date_id | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true|


### Association

- belongs_to :user
- has_one :purchase_record



## purchase_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column          | Type       | Options     |
| ------          | ---------- | ----------- |
| post_code       | string     | null: false |
| region_id       | integer    | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| phone_number    | string     | null: false |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

