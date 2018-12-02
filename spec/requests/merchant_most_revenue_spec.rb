require 'rails_helper'

describe 'Revenue per single mechant' do
  before(:all) do
    @merchant_1 = create(:merchant)
    @item_1 = create(:item, merchant: @merchant_1)
    @item_2 = create(:item, merchant: @merchant_1)
    @item_3 = create(:item, merchant: @merchant_1)
    @item_4 = create(:item, merchant: @merchant_1)

    @merchant_2 = create(:merchant)
    @item_5 = create(:item, merchant: @merchant_2)
    @item_6 = create(:item, merchant: @merchant_2)
    @item_7 = create(:item, merchant: @merchant_2)
    @item_8 = create(:item, merchant: @merchant_2)

    @customer_1 = create(:customer)
    @customer_2 = create(:customer)

    @inv_1 = create(:invoice, customer: @customer_1, merchant: @merchant_1)
    @inv_2 = create(:invoice, customer: @customer_2, merchant: @merchant_1)
    @inv_3 = create(:invoice, customer: @customer_1, merchant: @merchant_2)
    @inv_4 = create(:invoice, customer: @customer_2, merchant: @merchant_2)

    @inv_item_1 = create(:invoice_item, item: @item_1 , invoice: @inv_1)
    @inv_item_2 = create(:invoice_item, item: @item_2 , invoice: @inv_2)
    @inv_item_3 = create(:invoice_item, item: @item_5 , invoice: @inv_3)
    @inv_item_4 = create(:invoice_item, item: @item_6 , invoice: @inv_4)

    @tran_1 = create(:transaction, invoice: @inv_1)
    @tran_2 = create(:transaction, invoice: @inv_2)
    @tran_3 = create(:transaction, invoice: @inv_3)
    @tran_4 = create(:transaction, invoice: @inv_4)

  end

  it "should return the revenue per merchant successful transactions" do

    get "/api/v1/merchants/#{@merchant_1.id}/revenue"

    total_revenue = ((@inv_item_1.quantity * @inv_item_1.unit_price) + (@inv_item_2.quantity * @inv_item_2.unit_price)) / 100.00

    expect(response).to be_successful

    revenue = JSON.parse(response.body)

    expect(revenue['data']['attributes']['revenue']).to eq(total_revenue.to_s)
  end
end
