require 'rails_helper'

RSpec.describe OrdersOrdersdetail, type: :model do
  describe '購入履歴の保存' do
    before do
      user = FactoryBot.create(:user)
      @orders_ordersdetail = FactoryBot.build(:orders_ordersdetail, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@orders_ordersdetail).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @orders_ordersdetail.building = ''
        expect(@orders_ordersdetail).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @orders_ordersdetail.post_code = ''
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @orders_ordersdetail.post_code = '1234567'
        @orders_ordersdetail.valid?
        expect(@orders_ordersdetail.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'cityが空だと保存できないこと' do
        @orders_ordersdetail.city = ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @orders_ordersdetail.block = ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @orders_ordersdetail.phone_number = ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Phone number can't be blank")
      end
     
      it 'phone_numberは半角数値でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '２２２２２２２'
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
      it 'phone_number10桁以上11桁以内でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '123456789012'
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Phone number is invalid")
      end
    end



  end
end