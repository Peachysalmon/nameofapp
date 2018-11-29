class Product < ApplicationRecord
  validates :name, presence: true
  def self.search(search_term)
    if Rails.env.production?  #=> true
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
  has_many :comments, :dependent => :destroy
  def highest_rating_comment
    comments.rating_desc.first
  end
  def lowest_rating_comment
    comments.rating_asc.first
  end
  def average_rating
    comments.average(:rating).to_f
  end
end
