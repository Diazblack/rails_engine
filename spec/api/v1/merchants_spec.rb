require 'rails_helper'

describe 'Mechants' do
  it 'should send a list with all merchants' do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(Merchant.all.count).to eq(4)
    expect(Merchant.first.name).to eq(mer_1.name)
    expect(Merchant.last.name).to eq(mer_4.name)

  end
end
