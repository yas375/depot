class Product < ActiveRecord::Base
  validates_presence_of :description, :image_url
  validates_numericality_of :price

  validates_presence_of :title, :message => 'Product can not be empty' 
  validates_length_of :title, :maximum => 15
  validates_uniqueness_of :title

  validate :price_must_be_at_least_cent

  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "Only gif, jpn and png allowed", :allow_blank => true

  #Product.for_sale.all
  named_scope :for_sale, :order => :title

protected
  def price_must_be_at_least_cent
    errors.add(:price, "Must be more then zero") if price.nil? || price < 0.01
  end
  
end

