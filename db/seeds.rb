# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.create(name:  "Nirvana", description: "desc", origin: "Seattle WA", genres: "Rock", image_file_name: "Nirvana.jpg")
Artist.create(name:  "Nirvana", description: "desc", origin: "Seattle WA", genres: "Rock", 
              image_file_name: "pearl.jpg")
Artist.create(name:  "Nirvana", description: "desc", origin: "Seattle WA", genres: "Rock", 
              image_file_name: "Nirvana.jpg")
Artist.create(name:  "Nirvana", description: "desc", origin: "Seattle WA", genres: "Rock", 
              image_file_name: "1.jpg")
Artist.create(name:  "Nirvana", description: "desc", origin: "Seattle WA", genres: "Rock", 
              image: File.new("app/assets/images/1.jpg"))

2.times do |n|
     Artist.create(name:  "#{n}", description: "desc", origin: "Seattle WA", genres: "Rock", 
              image_file_name: "#{n}.jpg")
end
