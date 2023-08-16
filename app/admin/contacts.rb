ActiveAdmin.register Contact do

  permit_params :subject,:message , :user_id


  form do |f|
    f.inputs "Contact Details" do
      f.input :user
      f.input :subject
      f.input :message
    end
    f.actions
  end

  index do
    selectable_column
    column :user
    column :subject
    column :message
    actions
  end

  # show do
  #   attributes_table do
  #     row :user
  #     row :subject
  #     row :message
  #     end
  # end
end