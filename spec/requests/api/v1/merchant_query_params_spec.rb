require 'rails_helper'

describe "Merchant find parameters" do

  it "should find merchant by name " do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)

    get "/api/v1/merchants/find?name=#{mer_2.name}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant['data']['attributes']["name"]).to eq(mer_2.name)

  end

  it "should find_all merchant by name " do
    mer_1, mer_2, mer_3, mer_4 = create_list(:merchant, 4)
    mer_5 = create(:merchant, name: "Plutark")
    mer_6 = create(:merchant, name: "plutark")

    get "/api/v1/merchants/find_all?name=Plutark"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant['data'].count).to eq(2)
    expect(merchant['data'].last["id"]).to eq(mer_6.id.to_s)

  end

  it "should find merchant by create_at " do
    mer_1 = create(:merchant, created_at: Time.now)
    mer_2 = create(:merchant, created_at: "2012-03-27 14:54:05 UTC" )

    get "/api/v1/merchants/find?created_at=2012-03-27 14:54:05 UTC"

    expect(response).to be_successful


    merchant = JSON.parse(response.body)

    expect(merchant['data']['id']).to eq(mer_2.id.to_s)

  end

  it "should find_all merchant by created_at " do
    mer_1 = create(:merchant, created_at: Time.now)
    mer_2 = create(:merchant, created_at: "2012-03-27 14:54:05 UTC" )
    mer_3 = create(:merchant, created_at: "2012-03-27 14:54:05 UTC" )
    mer_4 = create(:merchant, created_at: "2012-03-27 14:54:05 UTC" )

    get "/api/v1/merchants/find_all?created_at=2012-03-27 14:54:05 UTC"

    expect(response).to be_successful


    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(3)
    expect(merchants['data'].first["id"]).to eq(mer_2.id.to_s)
    expect(merchants['data'].last["id"]).to eq(mer_4.id.to_s)

  end

  it "should find merchant by updated_at " do
    mer_1 = create(:merchant, updated_at: Time.now)
    mer_2 = create(:merchant, updated_at: "2012-03-27 14:54:05 UTC" )

    get "/api/v1/merchants/find?updated_at=2012-03-27 14:54:05 UTC"

    expect(response).to be_successful


    merchant = JSON.parse(response.body)

    expect(merchant['data']['id']).to eq(mer_2.id.to_s)

  end

  it "should find_all merchant by updated_at " do
    mer_1 = create(:merchant, updated_at: Time.now)
    mer_2 = create(:merchant, updated_at: "2012-03-27 14:54:05 UTC" )
    mer_3 = create(:merchant, updated_at: "2012-03-27 14:54:05 UTC" )
    mer_4 = create(:merchant, updated_at: "2012-03-27 14:54:05 UTC" )

    get "/api/v1/merchants/find_all?updated_at=2012-03-27 14:54:05 UTC"

    expect(response).to be_successful


    merchants = JSON.parse(response.body)

    expect(merchants['data'].count).to eq(3)
    expect(merchants['data'].first["id"]).to eq(mer_2.id.to_s)
    expect(merchants['data'].last["id"]).to eq(mer_4.id.to_s)

  end


  it "Should return a random Merchant " do
    # There is a posibility of 1 in 50 that this test fail
    create_list(:merchant, 50)

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    merchant_1 = JSON.parse(response.body)

    get "/api/v1/merchants/random"

    merchant_2 = JSON.parse(response.body)

    expect(merchant_1['data']["id"]).to_not eq(merchant_2["id"])
  end

end
