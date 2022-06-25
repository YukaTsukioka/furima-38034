class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship  

  belongs_to :user
  has_one :order

 
  validates :image, presence: true
  validates :item, presence: true
  validates :description, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }
  #PRICE_REGEX ={ with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}



  has_one_attached :image

end
