99.times do |n|
  name  = Faker::Name.name
  Category.create!(name:  name)
end
User.create!(name:  "Example User", email: "hungnx96@gmail.com",
  password: "123123", password_confirmation: "123123", role: 1)
User.create!(name:  "Example User", email: "hungnx06@gmail.com",
  password: "123123", password_confirmation: "123123", role: 2)
