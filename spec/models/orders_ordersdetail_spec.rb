require 'rails_helper'

RSpec.describe OrdersOrdersdetail, type: :model do
  describe '購入履歴の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @orders_ordersdetail = FactoryBot.build(:orders_ordersdetail, user_id: user.id, item_id: item.id)
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
      it 'prefectureが未選択では登録できない' do
        @orders_ordersdetail.prefecture_id = '1'
        @orders_ordersdetail.valid?
      
        expect(@orders_ordersdetail.errors.full_messages).to include("Prefecture can't be blank")
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
      it 'phone_numberは10桁以上11桁以内でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '1234567890123'
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
      it 'phone_numberは9桁以下でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '12345678'
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
      
       
      it "tokenが空では登録できないこと" do
        @orders_ordersdetail.token = nil
        @orders_ordersdetail.valid?
        expect(@orders_ordersdetail.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では登録できないこと" do
        @orders_ordersdetail.user_id =  ''
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では登録できないこと" do
        @orders_ordersdetail.item_id =  ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Item can't be blank")
      end

    end



  end
end
