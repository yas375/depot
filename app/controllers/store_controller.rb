class StoreController < ApplicationController
  def index
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] +=1
    end
    @products = Product.for_sale
    @cart = find_cart
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    session[:counter] = nil
    respond_to do |format|
      format.js if request.xhr?
      format.html{redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attemt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    respond_to do |format|
      format.js if request.xhr?
      format.html{redirect_to_index}
    end
  end

  def decrement_quantity
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.decrement_product(product)
    respond_to do |format|
      format.js if request.xhr?
      format.html{redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attemt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index('Basket is empty')
    else
      @order = Order.new
    end
  end

private
  def find_cart
      session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => :index
  end
end