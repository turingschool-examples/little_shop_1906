class CartsController < ApplicationController
include ActionView::Helpers::TextHelper

  def create #add item to cart
    @item = Item.find(params[:item_id])
    item_id_str = @item.id.to_s
    session[:cart] ||= Hash.new(0)
    session[:cart][item_id_str] ||= 0
    session[:cart][item_id_str] = session[:cart][item_id_str] + 1
    quantity = session[:cart][item_id_str]
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{@item.name} in your cart."
    redirect_to '/items'
  end

private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end
end
