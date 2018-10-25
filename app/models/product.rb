class Product < ApplicationRecord
  def self.search(search_term)
    if Rails.env.production?  #=> true
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
  has_many :comments
  def highest_rating_comment
    comments.rating_desc.first.body
  end
  def lowest_rating_comment
    comments.rating_asc.first.body
  end
end
