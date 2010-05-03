class AddRefsToPaymentTypesToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_type_id, :integer
    remove_column :orders, :pay_type
  end

  def self.down
    remove_column :orders, :payment_type_id
    add_column :orders, :pay_type, :limit => 10
  end
end
