class ItemsController < ApplicationController
  def index
    @items = Item.scoped
    @items = @items.prefixed(params[:term]) if params[:term].present?
    respond_to do |format|
      format.json
    end
  end
end
