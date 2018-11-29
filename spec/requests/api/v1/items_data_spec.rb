require 'rails_helper'

describe 'Items' do
  before(:all) do
  @merchant = create(:merchant)
  @item_1 = create(:item, merchant: @merchant)
  @item_2 = create(:item, merchant: @merchant)
  @item_3 = create(:item, merchant: @merchant)
  @item_4 = create(:item, merchant: @merchant)
  end

  it 'Should send a list of items ' do

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(4)
    expect(items["data"].first["id"]).to eq(@item_1.id.to_s)
  end

  it 'Should send item by id' do


    get "/api/v1/items/#{@item_2.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"]["id"]).to eq(@item_2.id.to_s)
  end
end
