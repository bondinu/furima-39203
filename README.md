# README

## Users テーブル

| Column                          | Type   | Options     |
| ------------------              | ------ | ----------- |
| nickname                        | string | null: false, unique: true |
| email                           | string | null: false, unique: true |
| encrypted_password              | string | null: false |
| encrypted_password_confirmation | string | null: false |
| first_name                      | string | null: false |
| last_name                       | string | null: false |
| first_name_kana                 | string | null: false |
| last_name_kana                  | string | null: false |


## Addresses テーブル

| Column                          | Type       | Options     |
| ------------------              | ------     | ----------- |
| postcode                        | string     | null: false |
| city                            | string     | null: false |
| address                         | string     | null: false |
| building                        | string     | null: false |
| phone_number                    | string     | null: false |
| user                            | references | null: false, foreign_key: true |


## Items テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| title              | string     | null: false |
| description        | text       | null: false |
| cost               | string     | null: false |
| user               | references | null: false, foreign_key: true |


## Orders テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |