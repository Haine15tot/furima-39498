class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ... 他のバリデーションやコード ...

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters" }
  validates :c_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :c_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validate :password_complexity
  private

  def password_complexity
    return if password.blank? || password =~ /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/

    errors.add(:password, "is invalid. Include both letters and numbers")
  end

end
