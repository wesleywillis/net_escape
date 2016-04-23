# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_gear = [
  {gear_type: "mesh net", gear_quantity: 1, color: "red", wildlife: false, latitude: 25.373809, longitude: -30.585938, lost: true},
  {gear_type: "trawler", gear_quantity: 4, color: "brown", wildlife: false, latitude: -36.412442, longitude: -101.250000, lost: true},
  {gear_type: "lobster trap", gear_quantity: 10, color: "black", wildlife: false, latitude: -35.844535, longitude: -97.734375, found: true},
  {gear_type: "fishing pole", gear_quantity: 15, color: "multi", wildlife: false, latitude: 39.724089, longitude: 170.859375, lost: true},
  {gear_type: "mesh net", gear_quantity: 3, color: "yellow", wildlife: true, wildlife_type: "birds, salmon", wildlife_quantity: 1200, latitude: 35.263562, longitude: -177.187500, found: true},
]

seed_gear.each do |seed|
  Gear.create(seed)
end
