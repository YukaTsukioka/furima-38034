require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品登録' do
    context '商品出品登録できるとき' do
      it 'item、description、price、category、condition、shipping_charge、prefecture、days_to_shipが存在すれば登録できる' do
       expect(@item).to be_valid
      end
    end
    context '商品出品登録できないとき' do
      it 'itemが空では登録できない' do
        @item.item = '' 
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?  
        
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下の場合は保存できない' do
        @item.price = '298'
        @item.valid?  
        
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceが10,000,000以上の場合は保存できない' do
        @item.price = '10,000,001'
        @item.valid?  
       
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'priceは半角数値でないと登録できない' do
        @item.price = '５５５５５'
        @item.valid? 
         
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'categoryが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_chargeが未選択では登録できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'prefectureが未選択では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_to_shipが未選択では登録できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
       
        expect(@item.errors.full_messages).to include("User must exist")
      end




    end
  end 
end
