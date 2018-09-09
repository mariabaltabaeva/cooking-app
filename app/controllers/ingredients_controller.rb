class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
   @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      flash[:notice] = "It was saved."
      redirect_to @ingredient
    else
      flash.now[:alert] = "There was an error. Try again."
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.assign_attributes(ing_params)
    if @ingredient.save
      flash[:notice] = "It was saved."
      redirect_to @ingredient
    else
      flash.now[:alert] = "There was an error. Try again."
      render :edit
    end
  end

  private
  def ing_params
    params.require(:ingredient).permit(:name)
  end
end
