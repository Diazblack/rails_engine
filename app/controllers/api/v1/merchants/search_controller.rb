class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: Merchant.where(search_params)
  end

  def show
    render json: Merchant.find_by(search_params)
  end



  def search_params
    params.permit(:name, :created_at)
  end
end
