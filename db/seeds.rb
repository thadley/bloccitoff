require 'faker'

# Create 5 users with their own todos
5.times do
  password = Faker::Lorem.characters(10)
  user = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  user.skip_confirmation!
  user.save

  # Note: by calling `User.new` instead of `create`,
  # we create an instance of a user which isn't saved to the database.
  # The `skip_confirmation!` method sets the confirmation date
  # to avoid sending an email. The `save` method updates the database.

  5.times do
    todo = Todo.create(
      user: user,
      description: Faker::Lorem.sentence)
    # set the created_at to a time within the past week
    todo.update_attribute(:created_at, Time.now - rand(600..606461))
  end

    2.times do
    todo = Todo.create(
      user: user,
      description: Faker::Lorem.sentence)
    # set the created_at to a time greater than week
    todo.update_attribute(:created_at, Time.now - rand(604800..606461))
  end
end

user = User.first
user.skip_reconfirmation!
user.update_attributes(email: 'trisha.hadley@gmail.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Todo.count} todos created"
