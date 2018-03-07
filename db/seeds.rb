

Experience.destroy_all
# Sport.destroy_all
Event.destroy_all
User.destroy_all

Sport.create(name: 'Basketball')
Sport.create(name: 'Football')
Sport.create(name: 'Cricket')
Sport.create(name: 'Running')
Sport.create(name: 'Frisbee')
Sport.create(name: 'Rugby')
Sport.create(name: 'Tennis')
Sport.create(name: 'Table Tennis')


User.create(first_name: 'Bob', last_name: 'Parker', age: 18, email: 'bob@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Esti', last_name: 'Palacio', age: 23, email: 'esti@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Nozomi', last_name: 'Okuma', age: 22, email: 'nozomi@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Jane', last_name: 'Doe', age: 43, email: 'jane@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Milly', last_name: 'Brown', age: 32, email: 'milly@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'James', last_name: 'Brown', age: 19, email: 'james@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")

user = User.first
Experience.create(user_id: user, sport_id: 1, skill_level: 3)


Event.create(host_id: 1, sport_id: 6, address: "Meguro", date: 2018-03-11, max_players: 2)
Event.create(host_id: 2, sport_id: 3, address: "Gotanda", date: 2018-03-10, max_players: 3)
Event.create(host_id: 3, sport_id: 5, address: "Tokyo Station", date: 2018-03-12, max_players: 2)
Event.create(host_id: 4, sport_id: 3, address: "Ginza", date: 2018-03-30, max_players: 5)
Event.create(host_id: 6, sport_id: 4, address: "Shinagawa", date: 2018-18-12, max_players: 4)

puts "created the seeds!"

