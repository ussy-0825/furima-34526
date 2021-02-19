require 'rails_helper'

RSpec.describe Orderdelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @orderdelivery = FactoryBot.build(:orderdelivery, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいく時' do
      it '必要な情報を適切に入力すれば購入できる' do
        expect(@orderdelivery).to be_valid
      end
      it '建物名が入力されていなくても購入できる' do
        @orderdelivery.building = nil
        expect(@orderdelivery).to be_valid
      end
    end

    context '商品の購入がうまくいかない時' do
      it 'クレジットカード情報が入力されていなければ購入できない' do
        @orderdelivery.token = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が入力されていなければ購入できない' do
        @orderdelivery.postal_code = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に-(ハイフン)が無ければ購入できない' do
        @orderdelivery.postal_code = '1111111'
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include('Postal code code Input correctly')
      end
      it '都道府県が選択されていなければ購入できない' do
        @orderdelivery.prefectures_id = 0
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include('Prefectures Select')
      end
      it '市区町村が入力されていなければ購入できない' do
        @orderdelivery.city = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("City can't be blank")
      end
      it '番地が入力されていなければ購入できない' do
        @orderdelivery.address = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていなければ購入できない' do
        @orderdelivery.phone = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が半角数字でなければ購入できない' do
        @orderdelivery.phone = '０９０１１１１１１１１'
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号が半角数字でなければ購入できない' do
        @orderdelivery.phone = 'ゼロキューゼロイチイチ'
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号が英数混合では購入できない' do
        @orderdelivery.phone = '090aaaaaaaa'
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Phone number Input only number")
      end
      it 'user_idが空では購入できない' do
        @orderdelivery.user_id = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @orderdelivery.item_id = nil
        @orderdelivery.valid?
        expect(@orderdelivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
