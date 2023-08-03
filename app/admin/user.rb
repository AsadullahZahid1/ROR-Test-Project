ActiveAdmin.register User do
  # Your configuration for the User model in Active Admin goes here

  # For example, to display certain attributes in the index page:
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  # To add filters for the User model:
  filter :email
  filter :created_at

  # To customize the form for creating and editing users:
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end