class BountiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @bounties = BountyDecorator.newest.page(params[:page])
  end

  def show
    @bounty = BountyDecorator.find(params[:id])
  end

  def new
    @bounty = BountyWithPledge.new
  end

  def create
    @bounty = BountyWithPledge.new(bounty_params)

    if @bounty.save
      flash[:success] = t('bounties.bounty_posted')
      redirect_to @bounty.bounty
    else
      flash[:error] = t('bounties.couldnt_be_posted')
      render :new, status: :bad_request
    end
  end

  private
  def bounty_params
    params[:bounty_with_pledge].permit(
      :username, :amount, :comment).
      merge(user: current_user)
  end
end
