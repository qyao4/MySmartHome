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
  permit_params :name, :description, :quantity, :price, :discount, :category_id, images: []

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :description
    column :quantity
    column :price
    column :discount
    column :images do |product|
      if product.images.attached?
        image_tag url_for(product.images.first), width: '50' # adjust size
      end
    end
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
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do |product|
    attributes_table do
      row :name
      row :category
      row :description
      row :quantity
      row :price
      row :discount
      row :images do
        ul do
          product.images.each do |img|
            li do
              image_tag url_for(img)
            end
          end
        end
      end
    end
    active_admin_comments
  end

end
