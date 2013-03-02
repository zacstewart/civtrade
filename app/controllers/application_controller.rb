class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :initialize_new_shop

  def initialize_new_shop
    @new_shop = ShopDecorator.new(Shop.new)
  end

  def sign_in(user)
    sign_out
    session[:current_user_id] = user.id
  end

  def sign_out
    reset_session
  end

  def signed_in?
    session.has_key?(:current_user_id)
  end

  def current_user_id
    @current_user_id ||= session[:current_user_id]
  end

  def current_user
    @current_user ||=
      if signed_in?
        UserDecorator.find(current_user_id)
      else
        AnonymousUser.new
      end
  end
  helper_method :current_user

  def authenticate_user!
    unless signed_in?
      flash[:notice] = t('sessions.must_be_signed_in')
      redirect_to new_session_path
    end
  end
end
