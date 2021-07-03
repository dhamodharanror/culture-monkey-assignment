# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department::LIST.each do |name|
  Department.create(name: name)
end

5.times.each do |_|
  Employee.create(first_name:    Faker::Name.unique.name,
                  last_name:     Faker::Name.unique.name,
                  email_address: Faker::Internet.email,
                  phone:         Faker::PhoneNumber.cell_phone,
                  salary:        Faker::Number.number(digits: 6))
end
