class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(order_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:purchase_shipping
    ).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :street,
      :building,
      :phone
      ).merge(
        user_id: current_user.id,
        item_id: params[:item_id]
      )
   end
  
end
