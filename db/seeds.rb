

Experience.destroy_all

user = User.first
puts(user.id)

Sport.create(name: "tennis")

  Experience.create!(user_id: user, sport_id: 1, skill_level: 3)
  puts "created a experience!"
