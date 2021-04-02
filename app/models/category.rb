class Category < ApplicationRecord
    has_many :product_categories
    has_many :products, through: :product_categories
    belongs_to :source_category, optional: true, inverse_of: :subcategories, class_name: 'Category', foreign_key: 'subcategory_id'
    has_many :subcategories, inverse_of: :source_category, class_name: 'Category', foreign_key: 'subcategory_id', dependent: :destroy
    validates_uniqueness_of :name
end
