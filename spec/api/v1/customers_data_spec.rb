require 'rails_helper'


describe 'Customer' do
  it 'Should send a list of customers' do
    cus_1, cus_2, cus_3, cus_4 = create_list(:customer, 4)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(4)
    expect(customers.last["last_name"]).to eq(cus_4.last_name)
    expect(customers.first["id"]).to eq(cus_1.id)
  end

  it 'Should return the info of one customer' do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    cus_1 = JSON.parse(respons.body)


    expect()
  end
end
