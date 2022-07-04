class OrdersOrdersdetail
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフンを入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "が空では登録できない"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/,  message: "半角数値で入力してください"}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Ordersdetail.create(post_code: post_code, prefecture_id: prefecture_id,  city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end