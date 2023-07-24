class OrderController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end
end
