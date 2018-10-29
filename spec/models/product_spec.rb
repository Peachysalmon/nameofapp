require 'rails_helper'

describe Product do
    let (:product) { Product.create!(name: "race bike") }

    let (:user) { User.create!(email: "info@jonathan-meier.com", password: "helloworld") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
end

    it "returns the average rating of all comments" do
      expect(product.comments.average_rating).to eq 3
    end
end
