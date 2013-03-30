class ShopsController < ApplicationController
  def new
    @shop = ShopDecorator.new(Shop.new)
  end

  def index
    @shops = Shop.best.page(params[:page])
    @shops = @shops.search(params[:search]) if params[:search].present?
    @shops = ShopDecorator.decorate(@shops)

    respond_to do |format|
      format.json { render json: @shops }
      format.html
    end
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      flash[:success] = t('shops.shop_successfully_listed')
      redirect_to Shop
    else
      flash[:error] = t('shops.shop_listing_failed')
      render :new
    end

  end

  private

  def shop_params
    params[:shop].permit(:item_name, :seller_username,
                         :buy_amount ,:buy_price, :buy_currency,
                         :sell_amount, :sell_price, :sell_currency,
                         :city, :world, :location_x, :location_y, :location_z)
  end
end
