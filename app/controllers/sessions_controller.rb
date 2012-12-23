class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.authenticate
      sign_in @session.user
      flash[:success] = t('sessions.welcome_username', username: @session.user.username)
      redirect_to root_path
    else
      flash[:error] = t('sessions.sign_in_failed')
      render :new
    end
  end

  def destroy
    sign_out

    flash[:success] = t('sessions.youve_been_signed_out')
    redirect_to root_path
  end

  private
  def session_params
    params[:session].permit(:username, :password)
  end
end
