class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :price, numericality: { greater_than_or_equal_to: 0 }
  # validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :discount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  # validates :image, format: { with: /\Ahttps?:\/\/.*\.(png|jpg|jpeg)\z/i, message: "must be a valid image URL" }, allow_nil: true
end
