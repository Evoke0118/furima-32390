class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
  end

  def destroy
    if @item.user_id == current_user.id
     @item.destroy
     redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:postage_id,:region_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end