class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: RevenueSerializer.new(Revenue.new(Merchant.single_revenue(params[:id])))

  end
end
