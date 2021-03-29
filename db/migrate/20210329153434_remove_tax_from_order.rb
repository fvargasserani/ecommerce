class RemoveTaxFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :tax, :float
  end
end
