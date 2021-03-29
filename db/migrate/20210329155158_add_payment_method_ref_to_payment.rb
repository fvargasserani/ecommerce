class AddPaymentMethodRefToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :payment_method, null: false, foreign_key: true
  end
end
