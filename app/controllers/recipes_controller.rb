class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.with_attached_images
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @categories = Category.all.collect{|c| [c.name, c.id] }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.images.attach(params[:images])
    @recipe.ingredients = Ingredient.where()

    if @recipe.save
      flash[:notice] = "Recipe was saved."
      redirect_to @recipe
    else
      flash.now[:alert] = "There was a problem saving recipe.Try again later."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all.collect{|c| [c.name, c.id] }
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe was updated."
      redirect_to @recipe
else
  flash.now[:alert] = "There was an error saving the recipe. Try again later."
  render :edit
end
end

def destroy
  @recipe = Recipe.find(params[:id])

  if @recipe.destroy
    flash[:notice] = "\"#{@recipe.name}\" was deleted."
    redirect_to recipes_path
  else
    flash.now[:alert] = "There was an eror deleting the recipe."
    render :show
end
end

  private
   def recipe_params
     params.require(:recipe).permit(:name, :time, :instruction, :serving_size)
   end
end
