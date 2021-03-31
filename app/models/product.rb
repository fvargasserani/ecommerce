class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :variants, inverse_of: :product
    accepts_nested_attributes_for :variants, reject_if: :all_blank, allow_destroy: true

    def variant_size
        variants.pluck(:size)
    end

    def variant_color
        variants.pluck(:color)
    end

    def variant_stock
        variants.pluck(:stock)
    end
end
