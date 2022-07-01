class OrdersController < ApplicationController

  def index
    @orders_ordersdetail = OrdersOrdersdetail.new
    @item = Item.find(params[:item_id])
  end

  def create
   
    @item = Item.find(params[:item_id])
    @orders_ordersdetail = OrdersOrdersdetail.new(order_params)
    if @orders_ordersdetail.valid?
      pay_item
     
      @orders_ordersdetail.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:orders_ordersdetail).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token],  
      currency: 'jpy'              
    )
  end

end
