class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit]
  before_action :move_to_index, only: [:edit, :update, :destory]


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

  def edit
    redirect_to root_path unless current_user.id == @item.user_id 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end    
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:postage_id,:region_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end


