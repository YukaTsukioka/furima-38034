require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
       it 'nickname、email、email_confirmation,passwordとpassword_confirmation、last_name 、first_name、last_name_kana、が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'yyyyy'
        @user.valid?
       
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordは英字のみのパスワードでは登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        
        expect(@user.errors.full_messages).to include("パスワード半角英数字混合での入力してください")
      end
      it 'passwordは数字のみのパスワードでは登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
       
        expect(@user.errors.full_messages).to include("パスワード半角英数字混合での入力してください")
      end
      it 'passwordは全角文字を含むパスワードでは登録できない' do
        @user.password = "AAAAAA"
        @user.password_confirmation = "AAAAAA"
        @user.valid?
       
        expect(@user.errors.full_messages).to include("パスワード半角英数字混合での入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
       
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("名字はカタカナで入力して下さい。")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameに半角文字が含まれていると登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("名字に全角文字を使用してください")
      end
      it 'first_nameに半角文字が含まれていると登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("名前に全角文字を使用してください")
      end
      it 'last_name_kanaににカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'ああああああ'
        @user.valid?
       
        expect(@user.errors.full_messages).to include("名字はカタカナで入力して下さい。")
      end
      it 'first_name_kanaにカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'ああああああ'
        @user.valid?
       
        expect(@user.errors.full_messages).to include("名前はカタカナで入力して下さい。")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
       
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

    end  
  end
end
