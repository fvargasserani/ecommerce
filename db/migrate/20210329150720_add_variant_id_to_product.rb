class AddVariantIdToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :variant_id, :integer
  end
end
