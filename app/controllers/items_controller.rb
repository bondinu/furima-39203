class ItemsController < ApplicationController
  def index
  end

  def Item_params
    params.require(:item).permit(:title,:image).merge(user_id: current_user.id)#全部書く必要あり
  end
end
