class PledgesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @bounty = Bounty.find(params[:bounty_id])
    @pledge = @bounty.pledges.new(pledge_params)

    if @pledge.save
      flash[:success] = t('pledges.created')
      redirect_to @bounty
    else
      flash[:error] = t('pledges.couldnt_be_created')
      render 'bounties/show'
    end
  end

  private
  def pledge_params
    params[:pledge].permit(:amount, :comment).merge(user: current_user)
  end
end
