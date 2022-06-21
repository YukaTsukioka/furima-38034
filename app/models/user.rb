class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'に全角文字を使用してください' }  
         validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'に全角文字を使用してください' } 
         validates :last_name_kana, presence: true, format:{ with: /\A[\p{katakana}ー]+\z/, message: 'はカタカナで入力して下さい。'}
         validates :first_name_kana, presence: true, format: { with:/\A[\p{katakana}ー]+\z/, message: 'はカタカナで入力して下さい。'}
         validates :birthday, presence: true
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"


         #has_many :items
         #has_many :orders
end
