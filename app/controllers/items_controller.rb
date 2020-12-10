class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:edit, :update, :destroy]

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
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
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

  def redirect_to_root
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

end
