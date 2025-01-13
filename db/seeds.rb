# # db/seeds.rb

# # Clear existing data
# User.destroy_all
# Contact.destroy_all

# # Create users
# users = User.create!([
#   { email: 'user10@user.com', password: 'password123' },
#   { email: 'user11@user.com', password: 'password123' },
#   { email: 'user12@user.com', password: 'password123' },
#   { email: 'user13@user.com', password: 'password123' },
#   { email: 'user14@user.com', password: 'password123' }
# ])

# # Create contacts for each user (at least 50 contacts in total)
# contact_names = [
#   'Liam', 'Olivia', 'Noah', 'Emma', 'Oliver', 'Ava', 'Elijah', 'Sophia',
#   'William', 'Isabella', 'James', 'Mia', 'Benjamin', 'Evelyn', 'Lucas', 'Harper',
#   'Henry', 'Camila', 'Alexander', 'Gianna', 'Sebastian', 'Luna', 'Jack', 'Lily',
#   'Jackson', 'Amelia', 'Mateo', 'Hazel', 'Daniel', 'Aria', 'Michael', 'Zoe',
#   'Mason', 'Elizabeth', 'Ethan', 'Ellie', 'Logan', 'Grace', 'Elijah', 'Hannah',
#   'Aiden', 'Ivy', 'Owen', 'Ellie', 'Samuel', 'Avery', 'Jacob', 'Scarlett',
#   'Levi', 'Victoria'
# ]

# users.each_with_index do |user, index|
#   10.times do |i|
#     user.contacts.create!(
#       name: contact_names[index * 10 + i],
#       phno: "+91 12345678#{index}#{i}"
#     )
#   end
# end

# puts "Seed data created successfully!"
