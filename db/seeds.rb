# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])


#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "alma", email:"a@a.a")
User.create(name: "körte", email:"b@b.b")

20.times do
  name  = Faker::Name.name
  email = Faker::Internet.unique.email(name)
  user = User.create(name: name, email: email)
  (1+rand(4)).times do
    event = {}
    event[:title] = Faker::Hipster.sentence(1+rand(3))
    event[:location] = Faker::Company.name
    event[:date] = Time.now + (rand(200) - 100).days
    event[:description] = Faker::Hipster.paragraph
    user.events.create(event)
  end
end

(User.count * 5).times do
  user_id  = rand(User.count) + 1
  event_id = rand(Event.count) + 1

  Attendance.create(attendee_id: user_id, attended_event_id: event_id)
end