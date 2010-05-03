class PaymentType < ActiveRecord::Base
  belongs_to :order
  validates_presence_of :name
end
