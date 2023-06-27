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


## Items テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| title              | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| postage_id         | integer    | null: false |
| region_id          | integer    | null: false |
| deadline_id        | integer    | null: false |
| cost               | integer    | null: false |
| user               | references | null: false, foreign_key: true |


## Orders テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |