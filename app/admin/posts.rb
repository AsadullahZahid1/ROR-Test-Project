ActiveAdmin.register Post do
  permit_params :post, :title
  form do |f|
    f.inputs do
      f.input :title
      f.input :body
    end
    f.actions
  end

  index do
    selectable_column
    column :title
    column :body
    actions
  end
end
