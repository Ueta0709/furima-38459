# README

## users

|Column      |Type    |Options    |
|------------|--------|-----------|
|nickname    |string  |null: false|
|mail_address|string  |null: false|
|password    |string  |null: false|
|first_name  |string  |null: false|
|last_name   |string  |null: false|
|birthday    |datetime|null: false|


### Association

has_many :items
has_many :shopping_addresses

-----------------------------------------------------------

## items

|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|title          |string    |null: false                   |
|image          |text      |null: false                   |
|price          |integer   |null: false                   |
|text           |text      |null: false                   |
|category       |string    |null: false                   |
|condition      |string    |null: false                   |
|shipping_fee   |string    |null: false                   |
|shipping_area  |string    |null: false                   |
|shipping_period|string    |null: false                   |
|user_id        |references|null: false, foreign_key: true|


### Association

belongs_to :users
has_one :shopping_addresses

----------------------------------------------------------

## shopping_addresses

|Column        |Type      |Options                       |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|state         |string    |null: false                   |
|city          |string    |null: false                   |
|address_line_1|string    |null: false                   |
|address_line_2|string    |null: false                   |
|phon_number   |string    |null: false                   |
|user_id       |references|null: false, foreign_key: true|


### Association

belongs_to :users
belongs_to :shopping_addresses