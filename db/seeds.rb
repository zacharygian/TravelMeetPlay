

Experience.destroy_all
Event.destroy_all
Sport.destroy_all
User.destroy_all

Sport.create(name: 'Basketball')
Sport.create(name: 'Football')
Sport.create(name: 'Cricket')
Sport.create(name: 'Running')
Sport.create(name: 'Frisbee')
Sport.create(name: 'Rugby')
Sport.create(name: 'Tennis')
Sport.create(name: 'Badmington')
Sport.create(name: 'Baseball')
Sport.create(name: 'Bowling')
Sport.create(name: 'Boxing')
Sport.create(name: 'Cycling')
Sport.create(name: 'Golf')
Sport.create(name: 'Gym')
Sport.create(name: 'Hockey')
Sport.create(name: 'Kayaking')
Sport.create(name: 'Pool')
Sport.create(name: 'Rollerblading')
Sport.create(name: 'Pingpong')
Sport.create(name: 'Soccer')
Sport.create(name: 'Surfing')
Sport.create(name: 'Swimming')
Sport.create(name: 'Volleyball')

puts "created #{Sport.all.count} sports"

User.create(first_name: 'Bob', last_name: 'Parker', age: 18, email: 'bob@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Esti', last_name: 'Palacio', age: 23, email: 'esti@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Nozomi', last_name: 'Okuma', age: 22, email: 'nozomi@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Jane', last_name: 'Doe', age: 43, email: 'jane@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'Milly', last_name: 'Brown', age: 32, email: 'milly@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")
User.create(first_name: 'James', last_name: 'Brown', age: 19, email: 'james@example.com', password: "password", biography: "Lorem ipsum dolor amet tumblr thundercats edison bulb keytar swag street art banjo. Godard la croix air plant, cold-pressed venmo 8-bit freegan gastropub. Taiyaki waistcoat chambray viral, flexitarian synth crucifix polaroid. 90's organic bitters taiyaki umami pitchfork salvia.")

puts "created #{User.all.count} users"


user = User.first
Experience.create(user_id: user.id, sport_id: Sport.first.id, skill_level: 3)

puts "created #{Experience.all.count} experiences"


# host_id = User.all.sample.id
# sport_id = Sport.all.sample.id

Event.create(host_id: User.all.sample.id, sport_id: Sport.all.sample.id, address: "Meguro", date: Date.today - 3, max_players: 2, spots_left: 2, sku: "3", price_cents: 1000)
Event.create(host_id: User.all.sample.id, sport_id: Sport.all.sample.id, address: "Gotanda", date: Date.today + rand(1..10), max_players: 3, spots_left: 3, sku: "3", price_cents: 1000)
Event.create(host_id: User.all.sample.id, sport_id: Sport.all.sample.id, address: "Tokyo Station", date: Date.today + rand(1..10), max_players: 2, spots_left: 2, sku: "3", price_cents: 1000)
Event.create(host_id: User.all.sample.id, sport_id: Sport.all.sample.id, address: "Ginza", date: Date.today + rand(1..10), max_players: 5, spots_left: 5, sku: "3", price_cents: 1000)
Event.create(host_id: User.all.sample.id, sport_id: Sport.all.sample.id, address: "Shinagawa", date: Date.today + rand(1..10), max_players: 4, spots_left: 4, sku: "3", price_cents: 1000)

puts "created #{Event.all.count} events"

