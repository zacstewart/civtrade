class ReportsController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @report = @shop.reports.new

    if @report.save
      flash[:success] = t('reports.shop_reported')
    else
      flash[:error] = t('reports.your_report_couldnt_be_saved')
    end

    redirect_to Shop
  end
end
