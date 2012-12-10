class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :initialize_new_shop

  def initialize_new_shop
    @new_shop = ShopDecorator.new(Shop.new)
  end
end
