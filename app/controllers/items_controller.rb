class ItemsController < ApplicationController

  def index
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @items = @merchant.items
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.where(id: params[:id]).first
    if !@item
      flash[:error] = ['Item does not exist']
      redirect_to '/items'
    end
   end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.create(item_params)
    if item.save
      redirect_to "/merchants/#{merchant.id}/items"
    else
      flash[:error] = item.errors.full_messages
      redirect_to "/merchants/#{merchant.id}/items/new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to "/items/#{item.id}"
    else
      flash[:error] = item.errors.full_messages
      redirect_to "/items/#{item.id}/edit"
    end
  end

  def destroy
    if ItemOrder.where(item_id: params[:id]).empty?
      Review.delete(Review.where(item_id: params[:id]))
      Item.destroy(params[:id])
      redirect_to "/items"
    else
      flash[:error] = ['Item has been ordered and cannot be deleted']
      redirect_to "/items/#{params[:id]}"
    end
  end

  private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end

end
