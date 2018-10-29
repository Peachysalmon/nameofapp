require 'rails_helper'

describe Comment do

  let (:product) {Product.create!(name: "Race Bike") }
  let (:user) {User.create!(email: "test@gmx.de", password: "123456") }

  it "is valid comment" do
    expect(Comment.new(user: user, product: product, body: "nice", rating: 3)).to be_valid
  end

  it "is not valid without rating" do
    expect(Comment.new(user: user, product: product, body: "nice")).not_to be_valid
  end

  it "is not valid without body" do
    expect(Comment.new(user: user, product: product, rating: 3)).not_to be_valid
  end

end
