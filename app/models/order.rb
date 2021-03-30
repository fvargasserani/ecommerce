class Order < ApplicationRecord
    has_many :order_variants
    has_many :products, through: :order_variants
    has_many :payments
    belongs_to :user
end
