class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:order_id])
    @items_hash = Hash.new
    @total_cost = 0
    hash = @order.items.group(:item_id).count
    hash.each do |item_id, qty|
      @items_hash[Item.find(item_id)] = qty
      @total_cost += ((Item.find(item_id)).price * qty)
    end
  end

  def create
    order = Order.create(order_params)
    session[:cart].each do |item_id, qty|
      item = Item.find(item_id.to_i)
      qty.times do
        order.items << item
      end
    end
    session[:cart] = nil
    redirect_to "/orders/#{order.id}"
  end



  private
  def order_params
    params.permit(:name,:address,:city,:state,:zip)
  end

end
