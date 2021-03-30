class AddVariantRefToOrderVariant < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_variants, :variant, null: false, foreign_key: true
  end
end
