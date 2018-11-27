require 'rails_helper'

describe 'Items' do
  it 'Should send a list of items ' do
    merchant = create(:merchant)
    item_1, item_2, item_3, item_4 = create_list(:item, 4)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)
    expect(items.first["id"]).to eq(item_1.id)
  end
end
