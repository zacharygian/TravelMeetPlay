

# Experience.destroy_all
# # Sport.destroy_all
# Event.destroy_all
# User.destroy_all

Sport.create(name: 'Basketball')
Sport.create(name: 'Football')
Sport.create(name: 'Cricket')
Sport.create(name: 'Running')
Sport.create(name: 'Frisbee')
Sport.create(name: 'Rugby')
Sport.create(name: 'Tennis')
Sport.create(name: 'Table Tennis')


User.create(email: 'bob@example.com', password: "password")
User.create(email: 'john@example.com', password: "password")
User.create(email: 'esti@example.com', password: "password")
User.create(email: 'nozomi@example.com', password: "password")
User.create(email: 'julio@example.com', password: "password")
User.create(email: 'adam@example.com', password: "password")

user = User.first
Experience.create(user_id: user, sport_id: 1, skill_level: 3)

Event.create(host_id: 2, sport_id: 6, location: "Meguro", date: 2018-03-11, max_players: 2)
Event.create(host_id: 2, sport_id: 3, location: "Paris", date: 2018-03-10, max_players: 3)
Event.create(host_id: 2, sport_id: 5, location: "Tokyo Station", date: 2018-03-12, max_players: 2)
Event.create(host_id: 2, sport_id: 3, location: "Ginza", date: 2018-03-30, max_players: 5)
Event.create(host_id: 2, sport_id: 4, location: "Shinagawa", date: 2018-18-12, max_players: 4)

puts "created the seeds!"
