[:admin, :employee].each do |role|
  Role.find_or_create_by(:name => role)
end
admin = User.create(:email => "admin@yopmail.com", :password => "admin@yopmail.com", 
  :password_confirmation => "admin@yopmail.com", :username => "Admin", :role => "admin")