class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    @purchase_history_shopping_adress = PurchaseHistoryShoppingAdress.new
    if current_user.id == @item.user_id || @item.purchase_history.present?
      redirect_to root_path 
    end
  end

  def create
    @purchase_history_shopping_adress = PurchaseHistoryShoppingAdress.new(purchase_history_shopping_adress_params)
    if @purchase_history_shopping_adress.valid?
      pay_item
      @purchase_history_shopping_adress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_shopping_adress_params
    params.require(:purchase_history_shopping_adress).permit(:post_code, :shipping_area_id, :city, :address_line, :address_line_sub, :phon_number).merge(user_id: current_user.id, purchase_history_id: params[:purchase_history_id], item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_edc54370cb904eae4311a9ec"
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_history_shopping_adress_params[:token],
        currency: 'jpy'
      )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end