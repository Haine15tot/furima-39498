require 'faker'

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { 'aaa111' }
    password_confirmation { 'aaa111' }
    birthday { Faker::Date.birthday }
    first_name { "山田" }
    last_name { "太郎" }
    c_first_name { "ヤマダ" }
    c_last_name { "タロウ" }
  end
end