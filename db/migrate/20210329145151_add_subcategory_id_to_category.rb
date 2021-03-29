class AddSubcategoryIdToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :subcategory_id, :integer
  end
end
