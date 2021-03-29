class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.string :color
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
