require 'rails_helper'

describe 'Mechants' do
  it 'should go to index and see all merchants' do
    create_list(:merchants, 10)

    get '/api/v1/merchants.json'
  end
end
