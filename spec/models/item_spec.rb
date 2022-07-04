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
       
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?  
        
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが299以下の場合は保存できない' do
        @item.price = '298'
        @item.valid?  
        
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'priceが10,000,000以上の場合は保存できない' do
        @item.price = '10,000,001'
        @item.valid?  
       
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'priceは半角数値でないと登録できない' do
        @item.price = '５５５５５'
        @item.valid? 
        
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'categoryが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("カテゴリーが空では登録できない")
      end
      it 'conditionが未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("商品の状態が空では登録できない")
      end
      it 'shipping_chargeが未選択では登録できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("配送料の負担が空では登録できない")
      end
      it 'prefectureが未選択では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("発送元の地域が空では登録できない")
      end
      it 'days_to_shipが未選択では登録できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("発送までの日数が空では登録できない")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
       
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end




    end
  end 
end
