class Recipe < ApplicationRecord
  validates :name, :time, :instruction, :serving_size, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many_attached :images
  belongs_to :category
end
