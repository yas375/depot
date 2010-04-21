class StoreController < ApplicationController
  def index
    @products = Product.for_sale
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
  rescue ActiveRecord::RecordNotFound
    logger.error("Attemt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid product"
    redirect_to :action => :index
  end

  def empty_cart
    session[:cart] = nil
    flash[:notice] = 'Теперь ваша корзина пуста'
    redirect_to :action => :index
  end

private
  def find_cart
      session[:cart] ||= Cart.new
  end

end
