class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_item,only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user == current_user && !@item.order.present?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user == current_user
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :postage_id, :prefecture_id, :deadline_id, :cost,
                                 :image).merge(user_id: current_user.id)
  end
end
