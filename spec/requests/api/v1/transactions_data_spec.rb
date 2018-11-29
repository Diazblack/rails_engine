require 'rails_helper'

describe "Transactions" do
  before(:all) do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @inv_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
    @inv_2 = create(:invoice, customer: @customer_2, merchant: @merchant_1)
    @inv_3 = create(:invoice, customer: @customer_1, merchant: @merchant_2)
    @inv_4 = create(:invoice, customer: @customer_2, merchant: @merchant_2)
    @tran_1 = create(:transaction, invoice: @inv_1)
    @tran_2 = create(:transaction, invoice: @inv_2)
    @tran_3 = create(:transaction, invoice: @inv_3)
    @tran_4 = create(:transaction, invoice: @inv_4)
  end

  it "Should give a list of all Transactions" do

    get "/api/v1/transactions/"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions['data'].count).to eq(4)
    expect(transactions['data'].first["id"]).to eq(@tran_1.id.to_s)
  end

  it "Should give a transaction" do

    get "/api/v1/transactions/#{@tran_3.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)

    expect(transaction['data']['id']).to eq(@tran_3.id.to_s)
  end
end
