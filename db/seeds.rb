# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { full_name: "User One", email: "user-one@example.com" },
  { full_name: "User Two", email: "user-two@example.com" },
  { full_name: "User Three", email: "user-three@example.com" },
  { full_name: "User Four", email: "user-four@example.com" },
  { full_name: "User Five", email: "user-five@example.com" },
  { full_name: "User Six", email: "user-six@example.com" },
].map do |params|
  User.create!(params)
end
