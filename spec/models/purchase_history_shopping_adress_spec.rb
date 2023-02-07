require 'rails_helper'

RSpec.describe PurchaseHistoryShoppingAdress, type: :model do


  describe '購入機能' do
    before do
      @purchase_history_shopping_adress = FactoryBot.build(:purchase_history_shopping_adress)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_history_shopping_adress.post_code = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Post code can't be blank", "Post code is invalid", "Shipping area can't be blank")
      end

      it 'post_codeが(3文字ハイフン4文字)でないと保存できないこと' do
        @purchase_history_shopping_adress.post_code = '0000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Post code is invalid", "Shipping area can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_history_shopping_adress.city = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'address_lineが空だと保存できないこと' do
        @purchase_history_shopping_adress.address_line = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank", "Address line can't be blank")
      end

      it 'phon_numberが空だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank", "Phon number can't be blank", "Phon number is too short (minimum is 10 characters)", "Phon number is invalid")
      end

      it 'phon_numberが9桁以下だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = '00000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank", "Phon number is too short (minimum is 10 characters)")
      end

      it 'phon_numberが12桁以上だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = '000000000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank", "Phon number is too long (maximum is 11 characters)")
      end

      it 'phon_numberが半角数値でないと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = 'aaaaaaaaaa'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank", "Phon number is invalid")
      end
    
       
      it "tokenが空では登録できないこと" do
        @purchase_history_shopping_adress.token = nil
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
