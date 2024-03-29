class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy, :show]
  before_action :set_item_other, only: [:edit]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :edit_move_to_index, only: [:edit]

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
  
end

def edit
  
end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

def destroy
  if current_user.id == @item.user_id
    @item.destroy
    redirect_to root_path
  end
end

private

def item_params
  params.require(:item).permit(:title,:text,:image,:category_id,:condition_id, :shipping_fee_id, :shipping_area_id, :shipping_period_id, :price).merge(user_id: current_user.id)
end

def edit_move_to_index
  unless current_user.id == @item.user_id 
    redirect_to action: :index
  end
end

def set_item
  @item = Item.find(params[:id])
end

def set_item_other
  @item = Item.find(params[:id])
  if @item.purchase_history.present?
    redirect_to root_path
  end
end

end
