class UsersController < ApplicationController
  def show
    @user = UserDecorator.find_by_param(params[:id])
  end
end
