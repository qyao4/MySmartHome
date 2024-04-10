ActiveAdmin.register Province do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :pst, :gst, :abbr, :hst
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :pst, :gst, :abbr, :hst]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # 允许通过表单提交的参数
  permit_params :name, :pst, :gst

  # 定义在索引页上显示的列
  index do
    selectable_column
    id_column
    column :name
    column :pst
    column :gst
    actions
  end

  # 过滤器，用于搜索数据
  filter :name
  filter :pst
  filter :gst

  # 表单配置
  form do |f|
    f.inputs do
      f.input :name
      f.input :pst
      f.input :gst
    end
    f.actions
  end

  # 显示页面的配置
  show do
    attributes_table do
      row :name
      row :pst
      row :gst
      row :created_at
      row :updated_at
    end
  end

  # 编辑或新建页面的配置
  form do |f|
    f.inputs 'Province Details' do
      f.input :name
      f.input :pst, as: :number, step: :any
      f.input :gst, as: :number, step: :any
    end
    f.actions
  end

end
