class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :set_item, only: [:show, :edit, :update ]

  def index
    @items = Item.all.order("created_at DESC")
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
    # @item = Item.find(params[:id])  DRY思想によりまとめてset_itemに記述 before_actionで実行させる
  end

  def edit
    # @item = Item.find(params[:id])  DRY思想によりまとめてset_itemに記述 before_actionで実行させる
  end

  def update
    # @item = Item.find(params[:id])  DRY思想によりまとめてset_itemに記述 before_actionで実行させる
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
    :name, :description, :price, :category_id, :condition_id, 
    :shipping_fee_id, :shipping_from_id, :shipping_start_id, 
    :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
