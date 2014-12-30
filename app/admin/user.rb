ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

 permit_params :email, :password, :password_confirmation, :role, :approved
 
    index do
        column :email
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :role
        column :approved
        actions
    end
 
    filter :email
 
    form do |f|
        f.inputs "User Details" do
            f.input :email
            f.input :password
            f.input :password_confirmation
            f.input :role, as: :radio, collection: {Author: "author", SuperAdmin: "super_admin", Administrator: "administrator"}
            f.input :approved
        end
        f.actions
    end

    controller do
        def update
          p "111111111111111111111"
                  params["user"]
          p "222222222222222222"
          user = params["user"]
            # If we haven't set a password explicitly, we don't want it reset so 
            # don't pass those fields upstream and devise will ignore them
          if  user && (user["password"] == nil || user["password"].empty?)
              user.delete("password")
              user.delete("password_confirmation")
        end

        update!
    end
end

end
