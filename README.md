## usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| nickname               | string     | null: false |
| e-mail                 | string     | null: false |
| password               | string     | null: false |
| last-name-full-width   | string     | null: false |
| first-name-full-width  | string     | null: false |
| last-name-kana         | string     | null: false |
| first-name-kana        | string     | null: false |
| birthday               | string     | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item-name       | string     | null: false                    |
| item-text       | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| delivery-fee-id | integer    | null: false                    |
| shipping-id     | integer    | null: false                    |
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
- has_one :deliveries

## deliveriesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal-code    | string     | null: false                    |
| prefectures-id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |

### Association
- belongs_to :order
