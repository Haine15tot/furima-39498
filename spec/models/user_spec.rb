require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    context '新規登録できるとき' do
      it '入力がすべて正しいとき' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = 'あいうえおか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "パスワードは、半角数字のみではできない" do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "パスワードは、半角英字のみではできない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end

    it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.encrypted_password = 'aaa111'
      @user.password_confirmation = 'eee111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end

  describe "新規登録/本人情報確認" do
    it "お名前(全角)は、名前が必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "お名前(全角)は、苗字が必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "お名前(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
    end

    it "お名前(苗字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
    end

    it "お名前カナ(名前)は、全角（カタカナ）での入力が必須であること" do
      @user.c_first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("C first name is invalid. Input full-width katakana characters")

      @user.c_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("C first name is invalid. Input full-width katakana characters")

    end



    it "お名前カナ(苗字)は、全角（カタカナ）での入力が必須であること" do
      @user.c_last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("C last name is invalid. Input full-width katakana characters")

      @user.c_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("C last name is invalid. Input full-width katakana characters")
    end


    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
