class LineItem < ActiveRecord::Base
  #belongs
  belongs_to :order
  belongs_to :product
  #has_one
  #has_many
end
