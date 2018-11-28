require 'rails_helper'

describe "Merchant find parameters" do

  it "should find merchant by name " do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)

    get "/api/v1/merchants/find?name=#{mer_2.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(mer_2.name)

  end

  it "should find_all merchant by name " do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)
    mer_5 = create(:merchant, name: "Plutark")
    mer_6 = create(:merchant, name: "plutark")

    get "/api/v1/merchants/find_all?name=Plutark"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant.count).to eq(2)
    expect(merchant.last["id"]).to eq(mer_6.id)

  end

end
