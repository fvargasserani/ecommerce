class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :size
      t.string :color
      t.integer :stock

      t.timestamps
    end
  end
end
