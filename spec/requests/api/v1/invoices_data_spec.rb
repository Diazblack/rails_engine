require 'rails_helper'

describe "Invoices" do
  before(:all) do
    @merchant_1 = create(:merchant)
    @merchant_2 = create(:merchant)
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @inv_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
    @inv_2 = create(:invoice, customer: @customer_2, merchant: @merchant_1)
    @inv_3 = create(:invoice, customer: @customer_1, merchant: @merchant_2)
    @inv_4 = create(:invoice, customer: @customer_2, merchant: @merchant_2)

  end
  it "Should give a list with all invoices" do

    get "/api/v1/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices['data'].count).to eq(4)
    expect(invoices['data'].last['id']).to eq(@inv_4.id.to_s)
    expect(invoices['data'].first['id']).to eq(@inv_1.id.to_s)

  end

  it "Should give a Invoices" do

    get "/api/v1/invoices/#{@inv_3.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice['data']['id']).to eq(@inv_3.id.to_s)

  end

end
