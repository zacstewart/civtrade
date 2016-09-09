class ShopsController < ApplicationController
  protect_from_forgery except: :create

  def new
    @shop = Shop.new
  end

  def index
    @shops = Shop.best.page(params[:page])

    @shops = ShopDecorator.decorate(@shops)

    respond_to do |format|
      format.html
    end
  end

  def create
    @shop = Shop.safely_create(shop_params)

    respond_to do |format|
      if @shop.persisted?
        format.html do
          flash[:success] = t('shops.shop_successfully_listed')
          redirect_to Shop
        end
      else
        format.html do
          flash[:error] = t('shops.shop_listing_failed')
          render :new
        end
      end
    end
  end

  private

  def shop_params
    params.require(:shop).permit(
      :output_item_name, :output_amount,
      :input_item_name, :input_amount,
      :seller_username, :city, :server_address, :world_uuid, :which,
      :location_x, :location_y, :location_z, :exchanges_available)
  end
end
