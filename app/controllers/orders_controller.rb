class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    
    redirect_to root_path
  end

  private

  def order_params
   
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  end



end
