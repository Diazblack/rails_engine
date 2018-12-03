class Api::V1::Customers::MerchantController < ApplicationController

  def show
    render json: FavoriteMerchantSerializer.new(Customer.favorite_merchant(params[:id]))
  end
end
