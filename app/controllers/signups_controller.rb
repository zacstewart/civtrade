class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      sign_in @signup.user
      flash[:success] = t('sessions.welcome_username', username: @signup.user.username)
      redirect_to root_path
    else
      flash[:error] = t('signups.signup_failed')
      render :new, status: :bad_request
    end
  end

  private
  def signup_params
    params[:signup].permit(
      :username, :password, :password_confirmation, :minecraft_login,
      :minecraft_password)
  end
end
