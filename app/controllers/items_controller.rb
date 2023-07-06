class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def Item_params
    params.require(:item).permit(:title,:description,:category_id,:status_id,:postage_id,:prefecture_id,:deadline_id,:cost,:image).merge(user_id: current_user.id)
  end
end
