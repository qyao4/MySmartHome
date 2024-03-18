ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :quantity, :price, :discount, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :quantity, :price, :discount, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # all the fields
  permit_params :name, :description, :quantity, :price, :discount, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :description
    column :quantity
    column :price
    column :discount
    actions
  end

  filter :name
  filter :category
  filter :price
  filter :quantity

  form do |f|
    f.inputs 'Product Details' do
      f.input :category # Product: belongs_to :category
      f.input :name
      f.input :description
      f.input :quantity, as: :number
      f.input :price
      f.input :discount, as: :number, hint: 'Enter a value between 0 and 1 for discount.'
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :category
      row :description
      row :quantity
      row :price
      row :discount
    end
    active_admin_comments
  end

end
