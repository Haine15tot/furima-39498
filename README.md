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

|nickname|string|null: false|
|mail    |string|null: false|
|password|string|null: false|
|birthday|date  |null: false|
|name    |string|null: false|

## items 

|image    |string    |null: false                      |
|name     |string    |null: false                      |
|text     |text      |null: false                      |
|category |string    |null: false                      |
|condition|string    |null: false                      |
|delivery |decimal   |null: false                      |
|address  |string    |null: false                      |
|date     |datetime  |null: false                      |
|price    |decimal   |null: false                      |
|seller   |references|foreign_key: { to_table: :users }|

## purchases

|post      |string    |null: false                      |
|prefecture|string    |null: false                      |
|region    |string    |null: false                      |
|address   |string    |null: false                      |
|building  |string    |null: false                      |
|number    |string    |null: false                      |
|buyer     |references|foreign_key: { to_table: :users }|