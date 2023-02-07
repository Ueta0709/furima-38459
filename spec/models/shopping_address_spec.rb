require 'rails_helper'

RSpec.describe ShoppingAddress, type: :model do
 
    before do
      @shopping_address = FactoryBot.build(:shopping_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @shopping_address.post_code = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'post_codeが(3文字ハイフン4文字)でないと保存できないこと' do
        @shopping_address.post_code = '0000000'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @shopping_address.city = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'address_lineが空だと保存できないこと' do
        @shopping_address.address_line = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'phon_numberが空だと保存できないこと' do
        @shopping_address.phon_number = ''
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'phon_numberが9桁以下だと保存できないこと' do
        @shopping_address.phon_number = '00000000'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'phon_numberが12桁以上だと保存できないこと' do
        @shopping_address.phon_number = '000000000000'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

      it 'phon_numberが半角数値でないと保存できないこと' do
        @shopping_address.phon_number = 'aaaaaaaaaa'
        @shopping_address.valid?
        expect(@shopping_address.errors.full_messages).to include("Title can't be blank")
      end

    end
  end
end
