class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_filter :assign_recipe, only: [:show]
  before_action :find_all_tag_list, only: [:new, :edit]
  def index
    @recipes = Recipe
    @recipes = search_recipes(params[:q]) if params[:q]
    @recipes = @recipes.paginate page: params[:page]
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = current_user.recipes.find params[:id]
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
   
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
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
    @all_tag_list = Recipe.tag_counts_on(:tags).collect(&:name).uniq
  end

  def search_recipes q
    q = "%#{q}%"
    Recipe.select('distinct recipes.*').joins("LEFT JOIN taggings on recipes.id = taggings.taggable_id").joins("LEFT JOIN tags on tags.id = taggings.tag_id").where('title ilike ? OR body ilike ? OR tags.name LIKE ?', q, q, q)
  end
end
