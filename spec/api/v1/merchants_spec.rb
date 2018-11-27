require 'rails_helper'
require 'rake'

describe 'Mechants' do

  it 'should send a list with all merchants' do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(4)
    expect(merchants.first["name"]).to eq(mer_1.name)
    expect(merchants.last["name"]).to eq(mer_4.name)
  end

  it 'should send info for one merchant' do
    mer_1 = create(:merchant).id

    get "/api/v1/merchants/#{mer_1}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(mer_1)

  end
end
