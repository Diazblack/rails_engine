require 'rails_helper'

describe 'Invoice Items' do

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

  it "Should give a list of Invoice Items" do

    get "/api/v1/invoice_items/"

    expect(response).to be_successful

    inv_items = JSON.parse(response.body)

    expect(inv_items['data'].count).to eq(4)
    expect(inv_items['data'].first['id']).to eq(@inv_item_1.id.to_s)
    expect(inv_items['data'].last['id']).to eq(@inv_item_4.id.to_s)
  end

  it "Should give a Invoice Items" do

    get "/api/v1/invoice_items/#{@inv_item_4.id}"

    expect(response).to be_successful

    inv_item = JSON.parse(response.body)

    expect(inv_item['data']['id']).to eq(@inv_item_4.id.to_s)
  end
end
