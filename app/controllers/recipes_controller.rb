class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_filter :assign_recipe, only: [:show, :edit]
  def index
    @recipes = Recipe
    @recipes = @recipes.tagged_with params[:q], any: true if params[:q]
    @recipes = @recipes.paginate page: params[:page]
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def show
    
  end

  private

  def assign_recipe
    @recipe = Recipe.find params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:title, :body, :status)
  end
end
