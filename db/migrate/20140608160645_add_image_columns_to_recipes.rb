class AddImageColumnsToRecipes < ActiveRecord::Migration
  def change
    add_attachment :recipes, :image
  end
end
