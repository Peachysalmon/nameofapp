require 'rails_helper'

describe Order do

  let (:product) {Product.create!(name: "Race Bike") }
  let (:user) {User.create!(email: "test@gmx.de", password: "123456") }

  it "is a valid order" do
    expect(Order.new(user: user, product: product, total: 100)).to be_valid
  end

  it "is not a valid withou user" do
    expect(Order.new(product: product, total:100)).not_to be_valid
  end

  it "is not a valid withou product" do
    expect(Order.new(user: user, total:100)).not_to be_valid
  end

end
