require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { Recipe.create!(name: "New Recipe Title", time: "30 min", category: "Salad", instruction: "1.Prepare veggies, which you like.2.Cut them in medium pieces.3.Put them in the bowl.4.Mix with your favorite dressing.", serving_size: 2)}
  describe "attributes" do
    it "has name, time, category, instruction and serving_size attributes" do
      expect(recipe).to have_attributes(name: "New Recipe Title", time: "30 min", instruction: "1.Prepare veggies, which you like.2.Cut them in medium pieces.3.Put them in the bowl.4.Mix with your favorite dressing.", serving_size: 2)
    end
  end
end
