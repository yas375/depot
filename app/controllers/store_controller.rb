class StoreController < ApplicationController
  def index
    @products = Product.for_sale
  end

end
