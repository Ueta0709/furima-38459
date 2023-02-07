require 'rails_helper'

RSpec.describe PurchaseHistoryShoppingAdress, type: :model do


  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_history_shopping_adress = FactoryBot.build(:purchase_history_shopping_adress, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_shopping_adress).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_history_shopping_adress.post_code = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it 'post_codeが(3文字ハイフン4文字)でないと保存できないこと' do
        @purchase_history_shopping_adress.post_code = '0000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Post code is invalid")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_history_shopping_adress.city = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineが空だと保存できないこと' do
        @purchase_history_shopping_adress.address_line = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phon_numberが空だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Phon number can't be blank")
      end

      it 'phon_numberが9桁以下だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = '00000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Phon number is too short (minimum is 10 characters)")
      end

      it 'phon_numberが12桁以上だと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = '000000000000'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Phon number is too long (maximum is 11 characters)")
      end

      it 'phon_numberが半角数値でないと保存できないこと' do
        @purchase_history_shopping_adress.phon_number = 'aaaaaaaaaa'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Phon number is invalid")
      end
    
       
      it "tokenが空では登録できないこと" do
        @purchase_history_shopping_adress.token = nil
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Token can't be blank")
      end

      it "itemが紐付いていなければ購入できないこと" do
        @purchase_history_shopping_adress.item_id = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Item can't be blank")
      end

      it "userが紐付いていなければ購入できない" do
        @purchase_history_shopping_adress.user_id = ''
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("User can't be blank")
      end

      it "都道府県に「---」が選択されている場合は購入できないこと" do
        @purchase_history_shopping_adress.shipping_area_id = '1'
        @purchase_history_shopping_adress.valid?
        expect(@purchase_history_shopping_adress.errors.full_messages).to include("Shipping area can't be blank")
      end

    end
  end
end
