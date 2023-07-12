class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ... 他のバリデーションやコード ...

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/ }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :c_first_name, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :c_last_name, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/ }
  validates :birthday, presence: true
end