class ItemsController < ApplicationController
  def index
    @items = Item.prefixed(params[:term]) if params[:term].present?
    render json: @items
  end

  def show
    @item = Item.find_by_param(params[:id])
    @shops = ShopDecorator.decorate(@item.shops.page(params[:page]))
  end
end
