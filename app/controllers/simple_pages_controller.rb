class SimplePagesController < ApplicationController
  def index
  end
end

class SimplePagesController < ApplicationController
  def landing_page
    @featured_product = Product.first
  end
  def landing_page
    @products = Product.limit(3)
  end
end
