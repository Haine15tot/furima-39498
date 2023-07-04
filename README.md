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

|nickname          |string    |null: false      |
|email             |string    |unique: true     |
|encrypted_password|string    |null: false      |
|birthday          |date      |null: false      |
|first_name        |string    |null: false      |
|last_name         |string    |null: false      |
|c_first_name      |string    |null: false      |
|c_last_name       |string    |null: false      |

### Association

has_many :items
belongs_to :informations

## items 

|items_name        |string    |null: false      |
|item_text         |text      |null: false      |
|category_id       |string    |null: false      |
|condition_id      |string    |null: false      |
|delivery          |decimal   |null: false      |
|address           |string    |null: false      |
|date              |datetime  |null: false      |
|price             |integer   |null: false      |
|user              |references|foreign_key: true|

### Association

belongs_to :users
belongs_to :purchases

## purchases
|items_name        |string    |foreign_key: true|
|user              |references|foreign_key: true|

### Association

belongs_to :items
belongs_to :informations

## informations
|number            |string    |null: false      |
|building          |string    |                 |
|address           |string    |null: false      |
|region            |string    |null: false      |
|prefecture_id     |integer   |null: false      |
|post              |string    |null: false      |

### Association
belongs_to :users
belongs_to :purchases
