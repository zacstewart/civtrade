class VerificationsController < ApplicationController
  def new
    @verifier = MinecraftAccountVerifier.new(current_user.username)
  end

  def create
    @verifier = MinecraftAccountVerifier.new(current_user.username)

    if @verifier.authentic? && current_user.mark_verified
      flash[:success] = t('verifications.you_have_been_verified')
      redirect_to root_path
    else
      flash[:error] = @verifier.error
      render :new
    end
  end
end
