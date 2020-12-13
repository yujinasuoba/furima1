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

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchase_records


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| users        | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| price             | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| shipping_from_id  | integer    | null: false                    |
| shipping_start_id | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :purchase_record

## purchase_record テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

- belongs_to :item
- belongs_to :user
- has_one :shipping_address

      t.references :user,        null: false,  foreign_key: true
      t.references :item,        null: false,  foreign_key: true

## shipping_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| street          | string     | null: false                    |
| building        | string     |                                |
| phone           | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

- belongs_to :purchase_record

      t.string     :postal_code,        null: false
      t.integer    :prefecture_id,      null: false
      t.string     :city,               null: false
      t.string     :street,             null: false
      t.string     :building,           null: false
      t.string     :phone,              null: false
      t.references :purchase_record,    foreign_key: true 