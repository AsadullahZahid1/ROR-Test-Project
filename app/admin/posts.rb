ActiveAdmin.register Post do
  permit_params :title, :body, :user_id
  form do |f|
    f.inputs do
      f.input :user, collection: User.all, include_blank: false
      f.input :title
      f.input :body
    end
    f.actions
  end

  # index do
  #   selectable_column
  #   column :title
  #   column :body
  #   actions
  # end

  show do
    attributes_table do
      row :id
      row :user
      row :title
      row :body
      row :created_at
      row :updated_at
    end
  end





  index pagination_total_count: false do
    column :id
    column :title
    column :author
    column "Current User", :user
    actions
    end
end
