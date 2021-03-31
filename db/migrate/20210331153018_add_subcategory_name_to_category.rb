class AddSubcategoryNameToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :subcategory_name, :string
  end
end
