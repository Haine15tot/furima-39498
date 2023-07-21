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




## users

|nickname          |string    |null: false             |
|email             |string    |null: false,unique: true|
|encrypted_password|string    |null: false             |
|birthday          |date      |null: false             |
|first_name        |string    |null: false             |
|last_name         |string    |null: false             |
|c_first_name      |string    |null: false             |
|c_last_name       |string    |null: false             |

### Association

has_many :items
has_many:purchases


## items 

|items_name        |string    |null: false                   |
|item_text         |text      |null: false                   |
|category_id       |integer   |null: false                   |
|condition_id      |integer   |null: false                   |
|delivery_id       |integer   |null: false                   |
|prefecture_id     |integer   |null: false                   |
|load＿id          |integer   |null: false                   |
|price             |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
belongs_to :condition, class_name: 'Condition', foreign_key: 'condition_id'
belongs_to :delivery_fee, class_name: 'DeliveryFee', foreign_key: 'delivery_id'
belongs_to :send, class_name: 'Send', foreign_key: 'send_id'
belongs_to :purchas

## purchases
|item             |references|null: false, foreign_key: true|
|user             |references|null: false, foreign_key: true|

### Association

belongs_to :item
has_one :information
belongs_to :user


## informations
|number            |string    |null: false      |
|building          |string    |                 |
|address           |string    |null: false      |
|region            |string    |null: false      |
|prefecture_id     |integer   |null: false      |
|post              |string    |null: false      |
|purchase       |references|null: false, foreign_key: true|

### Association

belongs_to :purchase
belongs_to :prefecture, class_name: 'Prefecture', foreign_key: 'prefecture_id'