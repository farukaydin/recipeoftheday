class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :body
      t.integer :status
      t.references :user, index: true

      t.timestamps
    end

    add_index :recipes, :title
  end
end
