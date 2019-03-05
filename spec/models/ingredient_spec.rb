require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient) { Ingredient.create!(name: "Apple")}
  describe "attribute" do
    it "has name attribute" do
      expect(ingredient).to have_attributes(name: "Apple")
    end
  end

end
