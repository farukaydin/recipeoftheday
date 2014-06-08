class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_filter :assign_recipe, only: [:show, :edit]
  before_action :find_all_tag_list, only: [:new]
  def index
    @recipes = Recipe
    @recipes = @recipes.tagged_with params[:q], match_all: true if params[:q]
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
    params.require(:recipe).permit(:title, :body, :status, :image, :tag_list)
  end

  def find_all_tag_list
    @all_tag_list = []
    Recipe.all.each do |recipe|
      recipe.tag_list.each do |tag|
        @all_tag_list << tag.html_safe
      end
    end
    @all_tag_list.uniq!
  end
end
