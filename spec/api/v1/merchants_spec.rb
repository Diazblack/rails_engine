require 'rails_helper'

describe 'Mechants' do
  it 'should send a list with all merchants' do
    create_list(:merchant, 10)

    get '/api/v1/merchants'

    expect(response).to be_successful
  end
end
