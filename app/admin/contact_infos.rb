ActiveAdmin.register ContactInfo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :address, :postal_code, :phone, :email, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:address, :postal_code, :phone, :email, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :address, :postal_code, :phone, :email, :content

  form do |f|
    f.inputs "Contact Information" do
      f.input :address
      f.input :postal_code
      f.input :phone
      f.input :email
      f.input :content, as: :text
    end
    f.actions
  end

end
