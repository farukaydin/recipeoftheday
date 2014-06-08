class RecipesController < ApplicationController
  before_filter :assign_recipe, only: [:show]
  def index
    @recipes = Recipe
    @recipes = @recipes.tagged_with params[:q], any: true if params[:q]
    @recipes = @recipes.paginate page: params[:page]
  end

  def show
    
  end

  private

  def assign_recipe
    @recipe = Recipe.find params[:id]
  end
end
