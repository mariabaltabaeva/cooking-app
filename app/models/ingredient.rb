class Ingredient < ApplicationRecord
  has_many :recipes, through: recipe_ingredient
  has_many :recipe_ingredient
end
