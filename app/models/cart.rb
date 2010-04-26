class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
    end
    current_item
  end

  def decrement_product(product)
    current_item = @items.find { |item| item.product == product }
    if current_item
      if current_item.quantity <= 1 # если в корзине один или меньше (на всякий случай) товар этого элемента, то удалить этот товар из корзины
        # delete
        @items.delete(current_item)
      else
        current_item.decrement_quantity
      end
    end
  end
  
  def total_price
    @items.sum {|item| item.price}
  end

  def total_items
    @items.sum {|item| item.quantity}
  end

end