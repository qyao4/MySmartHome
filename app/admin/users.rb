ActiveAdmin.register User do

  # 定义 index 页面上要显示的列
  index do
    selectable_column
    id_column
    column :username
    column :email
    column :phone
    column :address
    column :city
    column "Province" do |user|
      user.province.name
    end
    column :postal_code
    # column :created_at
    # column :updated_at

    # 显示用户关联的订单总数
    column "Total Orders" do |user|
      user.orders.count
    end

    column "GST/HST" do |user|
      user.orders.sum(:gst)
    end

    column "PST" do |user|
      user.orders.sum(:pst)
    end

    # 显示用户所有订单的总价值
    column "Total Value" do |user|
      number_to_currency user.orders.sum(:total_with_taxes)
    end

    # 如果需要在列表页显示所有订单的具体产品列表和税收信息，
    # 可能需要自定义一个列或者为每个用户创建一个可展开的面板

    actions
  end

  # 其他代码 ...

  # 筛选条件
  filter :username
  filter :email
  filter :city
  filter :province, as: :select, collection: -> { Province.all }
  filter :postal_code
  filter :created_at
  filter :updated_at

  # 展示页的详情信息，可以包括用户的订单信息
  show do
    attributes_table do
      row :username
      row :email
      row :phone
      row :address
      row :city
      row "Province" do |user|
        user.province.name
      end
      row :postal_code
      row :created_at
      row :updated_at
    end

    panel "Orders" do
      table_for user.orders do
        column :id
        column "Products" do |order|
          order.order_items.map { |item| item.product.name }.join(", ")
        end
        column :gst
        column :pst
        column :total_with_taxes
        column :created_at
        # 其他你希望显示的订单信息
      end
    end
  end

end
