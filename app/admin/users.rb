ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :last_sign_in_at
    default_actions
  end  
end
