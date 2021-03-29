class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :order_products
    has_many :orders, through: :order_products
    belongs_to :source_product, optional: true, inverse_of: :variants, class_name: 'Product', foreign_key: 'variant_id'
    has_many :variants, inverse_of: :source_product, class_name: 'Product', foreign_key: 'variant_id', dependent: :destroy
end
