require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "新規登録/商品の出品" do
    context '商品の出品（正常系）' do
      it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品の出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品（異常系）' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "商品の説明が必須であること" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態の情報が必須であること" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担の情報が必須であること" do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "発送元の地域の情報が必須であること" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数の情報が必須であること" do
        @item.deadline_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline can't be blank")
      end
      it "価格の情報が必須であること" do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it "価格は、¥300~¥9,999,999の間のみ保存可能であること" do
        @item.cost = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be greater than or equal to 300")
      end
      it "価格は、¥300~¥9,999,999の間のみ保存可能であること" do
        @item.cost = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be less than or equal to 9999999")
      end
      it "価格は半角数値のみ保存可能であること" do
        @item.cost = '一万'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost is not a number")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
