class ItemsController < ApplicationController
  def index
    @items = Item.scoped
    @items = @items.prefixed(params[:term]) if params[:term].present?
    respond_to do |format|
      format.json
    end
  end

  def show
    @item = Item.find_by_param(params[:id])
    @shops = ShopDecorator.decorate(@item.shops.page(params[:page]))

    respond_to do |format|
      format.json
      format.html
    end
  end
end
