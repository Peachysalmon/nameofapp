class Product < ApplicationRecord
  def self.search(search_term)
    if Rails.env.production?  #=> true
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
  has_many :comment
  def highest_rating_comment
    comment.rating_desc.first
  end
  def lowest_rating_comment
    comment.rating_asc.first
  end
  def newest_rating_comment
    comment.created_at_desc.first
  end
end
