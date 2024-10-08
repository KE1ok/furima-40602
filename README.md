# テーブル設計

## users テーブル

| Column              | Type     | Options         |
| ------------------- | -------- | --------------- |
| nickname            | string   | null: false     |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false     |
| last_name           | string   | null: false     |
| first_name          | string   | null: false     |
| last_ruby           | string   | null: false     |
| first_ruby          | string   | null: false     |
| birthday            | date     | null: false     |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options         |
| ------------------- | ---------- | --------------- |
| item_name           | string     | null: false     |
| title               | text       | null: false     |
| price               | integer    | null: false     |
| user                | references | null: false, foreign_key: true |
| category_id         | integer    | null: false     |
| condition_id        | integer    | null: false     |
| shipping_fee_id     | integer    | null: false     |
| prefecture_id       | integer    | null: false     |
| shipping_date_id    | integer    | null: false     |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column              | Type       | Options         |
| ------------------- | ---------- | --------------- |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :area_data

## area_data テーブル

| Column              | Type       | Options         |
| ------------------- | ---------- | --------------- |
| postal_code         | string     | null: false     |
| prefecture_id       | integer    | null: false     |
| municipalities      | string     | null: false     |
| street              | string     | null: false     |
| building_name       | string     |                 |
| telephone           | string     | null: false     |
| purchase            | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase