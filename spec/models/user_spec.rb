require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_message).to include("Email can't be blank")
    end
    it 'passwordが6文字以上でないと登録できない' do
      @user.nickname = 'yyyyyyy'
      @user.valid?
      expect(@usssser.errors.full_message).to include("Nicknameis too long(mix is 6 charactors)")
    end
    it 'passwordは半角英数字混合の入寮でないと登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors_full_messages).to include("Password Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_cofirmation = '123457'
      @user.valid?
      expect(@user.errors.full_messages).to include(Password_cofirmation doesn't much Password)
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_name_kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user. = 'birthday'
      @user.valid?
      expect(@user.errors.full_message).to include("birthday can't be blank")
    end




  end
end
