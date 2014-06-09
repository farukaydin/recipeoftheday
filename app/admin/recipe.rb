ActiveAdmin.register Recipe do

  controller do
    def scoped_collection
      Recipe.unscoped
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :body, :status, :tag_list

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :tag_list
    column :status
    column :created_at
    actions
  end
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  filter :title
  filter :body
  filter :status
  filter :tag_list
  
end
