require 'rails_helper'

describe Product do

    before do
      @product = FactoryBot.create(:product)
      #let (:product) { Product.create!(name: "race bike") }
      @user = FactoryBot.create(:user)
      #let (:user) { User.create!(email: "info@jonathan-meier.com", password: "helloworld") }
      @comment1 = @product.comments.create(rating: 1, user: @user, body: "Awful bike!")
      @comment2 = @product.comments.create(rating: 3, user: @user, body: "Ok bike!")
      @comment3 = @product.comments.create(rating: 5, user: @user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3.0
    end

end
