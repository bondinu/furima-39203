# README

## Users テーブル

| Column                          | Type   | Options     |
| ------------------              | ------ | ----------- |
| nickname                        | string | null: false |
| email                           | string | null: false, unique: true |
| encrypted_password              | string | null: false |
| first_name                      | string | null: false |
| last_name                       | string | null: false |
| first_name_kana                 | string | null: false |
| last_name_kana                  | string | null: false |
| birthday                        | date   | null: false |

### Association
- has_many:orders
- has_many:items



## Addresses テーブル

| Column                          | Type       | Options     |
| ------------------              | ------     | ----------- |
| postcode                        | string     | null: false |
| prefecture_id                   | integer    | null: false |
| city                            | string     | null: false |
| address                         | string     | null: false |
| building                        | string     |             |
| phone_number                    | string     | null: false |
| order                           | references | null: false, foreign_key: true |

### Association
- belong_to:order



## Items テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| title              | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| postage_id         | integer    | null: false |
| prefecture_id      | integer    | null: false |
| deadline_id        | integer    | null: false |
| cost               | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to:user
- has_one:order



## Orders テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to:user
- belongs_to:item