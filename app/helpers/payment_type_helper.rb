module PaymentTypeHelper
  def payment_methods
    PaymentType.all.collect{|a| [a.name, a.id]}
  end
end
