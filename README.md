# README

## users

|Column            |Type    |Options                  |
|------------------|--------|-------------------------|
|nickname          |string  |null: false              |
|email             |string  |null: false, unique: true|
|encrypted_password|string  |null: false              |
|first_name        |string  |null: false              |
|last_name         |string  |null: false              |
|first_name_kana   |string  |null: false              |
|last_name_kana    |string  |null: false              |
|birthday          |date    |null: false              |


### Association

has_many :items
has_many :purchase_histories

-----------------------------------------------------------

## items

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|title             |string    |null: false                   |
|price             |integer   |null: false                   |
|text              |text      |null: false                   |
|category_id       |integer   |null: false                   |
|condition_id      |integer   |null: false                   |
|shipping_fee_id   |integer   |null: false                   |
|shipping_area_id  |integer   |null: false                   |
|shipping_period_id|integer   |null: false                   |
|user              |references|null: false, foreign_key: true|


### Association

belongs_to :user
has_one :purchase_history

----------------------------------------------------------

## purchase_histories

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|item          |references|null: false, foreign_key: true|
|user          |references|null: false, foreign_key: true|


### Association

belongs_to :user
belongs_to :item
has_one :shopping_address

----------------------------------------------------------

## shopping_addresses

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|post_code         |string    |null: false                   |
|shipping_area_id  |integer   |null: false                   |
|city              |string    |null: false                   |
|address_line      |string    |null: false                   |
|address_line_sub  |string    |null: false                   |
|phon_number       |string    |null: false                   |
|purchase_history  |references|null: false, foreign_key: true|


### Association

belongs_to :purchase_history
