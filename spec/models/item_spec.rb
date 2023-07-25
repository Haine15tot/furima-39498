require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, user: nil) # ファクトリでitemを生成
  end

  describe '出品' do
    context '出品できる時' do
      it '入力がすべて正しいとき' do
        # テストコード内でUserを作成
        user = FactoryBot.create(:user)

        # @itemを作成する際に、user_idを指定して作成
        @item = FactoryBot.build(:item, user_id: user.id)

        # 以下の行でuser_idがnilでないことを確認
        expect(@item.user_id).to eq(user.id)

        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it "商品名が必須であること" do
        @item.items_name = nil
        @item.valid?
        expect(@item.errors[:items_name]).to include("can't be blank")
      end

      it "商品の説明が必須であること" do
        @item.item_text = nil
        @item.valid?
        expect(@item.errors[:item_text]).to include("can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it "商品の状態の情報が必須であること" do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it "配送料の負担の情報が必須であること" do
        @item.load_id = '---'
        @item.valid?
        expect(@item.errors[:load_id]).to include("can't be blank")
      end

      it "発送元の地域の情報が必須であること" do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end

      it "発送までの日数の情報が必須であること" do
        @item.delivery_id = '---'
        @item.valid?
        expect(@item.errors[:delivery_id]).to include("can't be blank")
      end

      it "価格の情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it "価格は、¥300~¥9,999,999の間のみ保存可能であること" do
        @item.price = 200
        @item.valid?
        expect(@item.errors[:price]).to include("Price is out of setting range")

        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("Price is out of setting range")
      end

      it "価格は半角数値のみ保存可能であること" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors[:price]).to include("Price is invalid. Input half-width characters", "Price is out of setting range")
      end

      it "userが紐づいていない時は保存されない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end
      end
  end
end
