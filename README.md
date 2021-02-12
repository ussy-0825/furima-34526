## usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| nickname               | string     | null: false |
| email                  | string     | null: false |
| encrypted_password     | string     | null: false |
| last-name_full_width   | string     | null: false |
| first-name_full_width  | string     | null: false |
| last-name_kana         | string     | null: false |
| first-name_kana        | string     | null: false |
| birthday               | date       | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| shipping_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliveriesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |

### Association
- belongs_to :order
