99.times do |n|
  name = Faker::Name.name
  Category.create! name:  name
end
