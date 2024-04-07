ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :status, :user_id, :address, :city, :province_id, :post_code, :gst, :pst, :total_with_taxes
  #
  # or
  #
  # permit_params do
  #   permitted = [:status, :user_id, :address, :city, :province_id, :post_code, :gst, :pst, :total_with_taxes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :province_id, :status, :total_with_taxes, :gst, :pst, :address, :city, :post_code, order_items_attributes: [:id, :product_id, :quantity, :price, :_destroy]

  # 控制列表页展示的列
  index do
    selectable_column
    id_column
    column :user
    column :status
    column :total_with_taxes
    column :created_at
    actions
  end

  # 添加筛选项
  filter :user
  filter :status, as: :select, collection: ->{ Order.statuses }
  filter :created_at

  # 控制表单页的展示
  form do |f|
    f.inputs do
      f.input :user
      f.input :status, as: :select, collection: Order.statuses.keys
      f.input :total_with_taxes
      f.input :address
      f.input :city
      f.input :province
      f.input :post_code
      # 添加订单项的嵌套表单
      f.has_many :order_items, allow_destroy: true do |n_f|
        n_f.input :product
        n_f.input :quantity
        n_f.input :price
      end
    end
    f.actions
  end

  # 控制显示页的展示
  show do
    attributes_table do
      row :user
      row :status
      row :total_with_taxes
      row :gst
      row :pst
      row :address
      row :city
      row :province
      row :post_code
      row :created_at
      row :updated_at
    end
    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price
      end
    end
  end
end
