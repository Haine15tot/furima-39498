class Item < ApplicationRecord
  # ActiveHashの関連を設定
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :load
  has_one_attached :image
  belongs_to :user

  # バリデーション
  validates :image, presence: true
  validates :items_name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :delivery_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :prefecture_id, presence: true, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :load_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, message: "Price is invalid. Input half-width characters" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Price is out of setting range" }
end

