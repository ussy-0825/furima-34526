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

### Association
- has_many :items

## itemsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item-name  | string     | null: false                    |
| item-text  | text       | null: false                    |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## deliveriesテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal-code | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | string     | null: false                    |

### Association
- belongs_to :item
