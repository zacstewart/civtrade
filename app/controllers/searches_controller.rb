class SearchesController < ApplicationController
  def show
    @shops = IndexedShop.scoped
    @shops = @shops.search(params[:search]) if params[:search].present?
    if params[:near_x].present? || params[:near_z].present?
      @shops = @shops.near(location: [params[:near_x].to_i, params[:near_z].to_i])
    end
    @shops = @shops.to_a.map(&:shop)
    @shops = ShopDecorator.decorate(@shops)

    respond_to do |format|
      format.json { render json: @shops }
      format.html
    end
  end
end
