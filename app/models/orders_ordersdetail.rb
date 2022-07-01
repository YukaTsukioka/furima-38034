class OrdersOrdersdetail
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :order, :token

  with_options presence: true do
    validates :user_id
    validates :post_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/,  message: "is invalid. Input half-width characters."}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Ordersdetail.create(post_code: post_code, prefecture_id: prefecture_id,  city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end