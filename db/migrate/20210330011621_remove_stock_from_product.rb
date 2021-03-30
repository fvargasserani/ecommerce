class RemoveStockFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :stock, :string
  end
end
