# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Contact.create([
  { name: "Alice Johnson", phno: "+911234567890" },
  { name: "Bob Smith", phno: "+912345678901" },
  { name: "Charlie Brown", phno: "+913456789012" },
  { name: "David Wilson", phno: "+914567890123" },
  { name: "Ella White", phno: "+915678901234" },
  { name: "Frank Thompson", phno: "+916789012345" },
  { name: "Grace Lee", phno: "+917890123456" },
  { name: "Henry Miller", phno: "+918901234567" },
  { name: "Ivy Harris", phno: "+919012345678" },
  { name: "Jack Clark", phno: "+910123456789" }
])

