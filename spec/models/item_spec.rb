require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do #正常系
      it 'image,name,price,category_id,condition_id,shipping_fee_id,shipping_from_id,shipping_start_id,user_idがあれば登録可能' do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかない時' do
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Input from 300 to 9999999')
      end

      it 'priceが全角では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input from 300 to 9999999')
      end

      it 'priceが300円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input from 300 to 9999999')
      end

      it 'priceが9999999円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Input from 300 to 9999999')
      end

      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category Select')
      end

      it 'category_idの値が1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition Select')
      end

      it 'condition_idの値が1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", 'Shipping fee Select')
      end

      it 'shipping_fee_idの値が1では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee Select')
      end

      it 'shipping_from_idが空では登録できない' do
        @item.shipping_from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank", 'Shipping from Select')
      end

      it 'shipping_from_idの値が1では登録できない' do
        @item.shipping_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping from Select')
      end

      it 'shipping_start_idが空では登録できない' do
        @item.shipping_start_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping start can't be blank", 'Shipping start Select')
      end

      it 'shipping_start_idの値が1では登録できない' do
        @item.shipping_start_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping start Select')
      end

      it 'userが紐づいてないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
