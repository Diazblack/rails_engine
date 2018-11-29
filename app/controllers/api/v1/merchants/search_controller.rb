class Api::V1::Merchants::SearchController < ApplicationController

  def index
    render json: MerchantsSerializer.new(Merchant.where(search_params))
  end

  def show
    if search_params.empty?
      render json: MerchantsSerializer.new(Merchant.order('random()').first)
    else
      render json: MerchantsSerializer.new(Merchant.find_by(search_params))
    end
  end

  def search_params
    params.permit(:name, :created_at, :updated_at)
  end
end
