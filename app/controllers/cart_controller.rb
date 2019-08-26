class CartController < ApplicationController
  def add_item
    cart = Cart.new(session[:cart])
    item = Item.find(params[:item_id])
    cart.add_item(item.id)
    session[:cart] = cart.contents
    flash[:notice] = "#{item.name} added to cart."
    redirect_to '/items'
  end

  def show
    @cart = Cart.new(session[:cart])
    @items = Item.cart_items(@cart)
  end

  def empty_cart
    session[:cart] = {}
    flash[:notice] = "Your cart has been emptied."
    redirect_to '/cart'
  end

  def remove_item
    cart = Cart.new(session[:cart])
    item = Item.find(params[:item_id])
    cart.remove_item(item.id)
    session[:cart] = cart.contents
    redirect_to '/cart'
  end

  def increase
    cart = Cart.new(session[:cart])
    item = Item.find(params[:item_id])
    if cart.quantity_of(item.id) < item.inventory
      cart.add_item(item.id)
    else
      flash[:notice] = "Item out of stock"
    end
    session[:cart] = cart.contents
    redirect_to '/cart'
  end

  def decrease
    cart = Cart.new(session[:cart])
    item = Item.find(params[:item_id])
    if cart.quantity_of(item.id) > 1
      cart.subtract_item(item.id)
    else
      cart.remove_item(item.id)
    end
    session[:cart] = cart.contents
    redirect_to '/cart'
  end
end
