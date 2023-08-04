  ActiveAdmin.register Post do
    permit_params :title, :body, :user_id
    form do |f|
      f.inputs do
        f.input :user_id,as: :select, collection: User.all.map{|user|[user.email,user.id]}
        f.input :title
        f.input :body
        #Customize the form to include a dropdown to select the user

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
      column "Current User", :user
      column  "Assigned User", :user_id
      actions
    end
    filter :title
    filter :user
  end
