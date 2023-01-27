class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    Order.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title,:text,:image,:category_id,:condition_id, :shipping_fee_id, :shipping_area_id, :shipping_period_id, :price).merge(user_id: current_user.id)
  end

end
