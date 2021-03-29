class RemoveSubtotalFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :subtotal, :float
  end
end
