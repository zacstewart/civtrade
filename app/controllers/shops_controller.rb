class ShopsController < ApplicationController
  protect_from_forgery except: :create

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
    @shop = Shop.
      where(shop_params.slice(:location_x, :location_y, :location_z)).
      first_or_initialize

    @shop.assign_attributes(shop_params)

    respond_to do |format|
      if @shop.save
        format.html do
          flash[:success] = t('shops.shop_successfully_listed')
          redirect_to Shop
        end
        format.json { render json: @shop, status: :created }
      else
        format.html do
          flash[:error] = t('shops.shop_listing_failed')
          render :new
        end
        format.json { head :bad_reqest }
      end
    end
  end

  private

  def shop_params
    params[:shop].permit(:item_name, :seller_username,
                         :buy_amount ,:buy_price, :buy_currency,
                         :sell_amount, :sell_price, :sell_currency,
                         :city, :server, :world, :location_x, :location_y, :location_z)
  end
end
