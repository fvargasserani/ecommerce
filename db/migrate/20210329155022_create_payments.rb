class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.float :subtotal
      t.float :tax
      t.float :total

      t.timestamps
    end
  end
end
