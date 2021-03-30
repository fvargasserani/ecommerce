class Variant < ApplicationRecord
    has_many :order_variants
    has_many :orders, through: :order_variants
    belongs_to :product
end
