require 'rails_helper'

describe Comment do
  before do
    @product = FactoryBot.create(:product, name: "Race Bike")
    #let (:product) {Product.create!(name: "Race Bike") }
    @user = FactoryBot.create(:user)
    #let (:user) {User.create!(email: "test@gmx.de", password: "123456") }
  end

  it "is valid comment" do
    expect(Comment.new(user: @user, product: @product, body: "nice", rating: 3)).to be_valid
  end

  it "is not valid without rating" do
    expect(Comment.new(user: @user, product: @product, body: "nice")).not_to be_valid
  end

  it "is not valid without body" do
    expect(Comment.new(user: @user, product: @product, rating: 3)).not_to be_valid
  end

end
