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
        
        expect(@orders_ordersdetail.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @orders_ordersdetail.post_code = '1234567'
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("郵便番号ハイフンを入力してください")
      end
      it 'prefectureが未選択では登録できない' do
        @orders_ordersdetail.prefecture_id = '1'
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("都道府県が空では登録できない")
      end

      it 'cityが空だと保存できないこと' do
        @orders_ordersdetail.city = ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと保存できないこと' do
        @orders_ordersdetail.block = ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @orders_ordersdetail.phone_number = ''
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("電話番号を入力してください")
      end
     
      it 'phone_numberは半角数値でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '２２２２２２２'
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("電話番号半角数値で入力してください")
      end
      it 'phone_numberは10桁以上11桁以内でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '1234567890123'
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("電話番号半角数値で入力してください")
      end
      it 'phone_numberは9桁以下でないと保存できないこと' do
        @orders_ordersdetail.phone_number = '12345678'
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("電話番号半角数値で入力してください")
      end
      
       
      it "tokenが空では登録できないこと" do
        @orders_ordersdetail.token = nil
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("トークンを入力してください")
      end

      it "user_idが空では登録できないこと" do
        @orders_ordersdetail.user_id =  ''
        @orders_ordersdetail.valid?
        
        expect(@orders_ordersdetail.errors.full_messages).to include("Userを入力してください")
      end

      it "item_idが空では登録できないこと" do
        @orders_ordersdetail.item_id =  ''
        @orders_ordersdetail.valid?
       
        expect(@orders_ordersdetail.errors.full_messages).to include("Itemを入力してください")
      end

    end



  end
end
