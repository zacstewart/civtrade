class ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page])
    @shops = @shops.where('lower(item) = lower(?)', params[:search]) if params[:search].present?
    @shops = ShopDecorator.decorate(@shops)
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      flash[:success] = t('shops.shop_successfully_listed')
    else
      flash[:error] = t('shops.shop_listing_failed')
    end

    redirect_to Shop
  end

  private

  def shop_params
    params[:shop].permit(:item, :buy_amount ,:buy_price, :buy_currency,
                         :sell_amount, :sell_price, :sell_currency,
                         :location_x, :location_y, :location_z)
  end
end
