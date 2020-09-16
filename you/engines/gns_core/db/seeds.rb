# Create default admin user for developing
puts "Create default admin user"
GnsCore::User.create(
  email: "intern@gmail.com",
  password: "123456@"
) if GnsCore::User.where(email: "intern@gmail.com").empty?