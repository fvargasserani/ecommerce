class Order < ApplicationRecord
    has_many :order_products
    has_many :products, through :order_products
    has_many :payments
    belongs_to :user
end
