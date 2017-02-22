User.destroy_all
League.destroy_all
Team.destroy_all
Membership.destroy_all
  
User.create(name: "Penlope",  age: 28)
User.create(name: "Pete",      age: 22)
User.create(name: "Pepe",      age: 34)
User.create(name: "Priscilla", age: 25)
    
League.create(name:        "Soccer", 
              day:         "Thursday",
              creator_id:  User.find_by(name: "Penelope").id)

League.create(name:        "Tennis", 
              day:         "Tuesday", 
              creator_id:  User.find_by(name: "Priscilla").id)

League.create(name:        "Hockey", 
              day:         "Wednesday",
              creator_id:  User.find_by(name: "Pepe").id)

Team.create(name:          "Green Monkeys",
            uniform_color: "green",
            captain_id:    User.find_by(name: "Pepe").id,
            league_id:     League.find_by(name: "Hockey").id)

Team.create(name:          "Silver Snakes",
            uniform_color: "silver",
            captain_id:    User.find_by(name: "Pete").id,
            league_id:     League.find_by(name: "Soccer").id)

Team.create(name:          "Purple Parrots",
            uniform_color: "purple",
            captain_id:    User.find_by(name: "Priscilla").id,
            league_id:     League.find_by(name: "Tennis").id)

Team.find_by(name:  "Green Monkeys").members << User.find_by(name: "Penelope")
Team.find_by(name:  "Green Monkeys").members << User.find_by(name: "Pepe")
Team.find_by(name:  "Green Monkeys").members << User.find_by(name: "Priscilla")

Team.find_by(name:  "Silver Snakes").members << User.find_by(name: "Pete")
Team.find_by(name: "Purple Parrots").members << User.find_by(name: "Priscilla")

League.find_by(name: "Soccer").teams << Team.find_by(name: "Purple Parrots")
League.find_by(name: "Soccer").teams << Team.find_by(name: "Silver Snakes")
