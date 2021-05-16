class OrdersController < ApplicationController
 
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]


  def index
    @order = PurchaseRecord.new
  end
 
  def create
    @order = PurchaseRecord.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:purchase_record).permit(:item_id, :post_code, :region_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.order.present?
      redirect_to root_path 
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
