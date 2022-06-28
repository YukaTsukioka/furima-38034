class OrdersOrdersdetail
  include ActiveModel::Model
  attr_accessor :item, :user_id, :post_code, :prefecture, :city, :building, :phone_number, :order 

  with_options presence: true do
    validates :user_id,
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX } 
  end

  def save
    order = Oeder.create(item: item, user_id: user_id)

    ordersdetail.create(post_code: post_code, prefecture: prefecture,  city: city, block: block, building: building, phone_number: phone_number, order_id: donation.id)
  end
end