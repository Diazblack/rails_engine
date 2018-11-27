class Api::V1::CustomersController < ApplicationController
  def index
    render json: Customer.all 
  end

  # def show
  # end
end
