class RemoveTypeFromPaymentTypes < ActiveRecord::Migration
  def self.up
    remove_column :payment_types, :type
  end

  def self.down
    add_column :payment_types, :type, :string
  end
end
