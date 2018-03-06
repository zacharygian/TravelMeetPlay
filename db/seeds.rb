

Experience.destroy_all

user = User.first
puts(user.id)

Sport.new(name: "tennis")

  Experience.new(user_id: user, sport_id: 1, skill_level: 3).save
  puts "created a experience!"
