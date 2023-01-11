require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do


    context '出品ができない時' do

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300より下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it 'priceが9999999より上では登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it 'categoryが空では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'conditionが空では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_feeが空では登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'shipping_areaが空では登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_periodが空では登録できない' do
        @item.shipping_period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping period can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    
    end


  end
  
end
