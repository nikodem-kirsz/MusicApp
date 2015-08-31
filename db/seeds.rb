# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# if !User.find_by(email: "example@org.pl")
# 	User.create!(email: "example@org.pl", password: "password")
# end
SONGS = ["heartbreaker.mp3", "moby_dick.mp3", "radio.mp3"]

18.times do |n|
	User.create!(email: "example#{n}@musicapp.com", password: "password")
end

18.times do |n|
		 user = User.all.sample
     user.artists.build(name: [Faker::App.name, Faker::App.name, Faker::App.name].sample,
     							 			description: "Tousled flexitarian distillery tote bag drinking vinegar, wolf vinyl synth letterpress you probably haven't heard of them tilde. Wolf DIY distillery irony Carles mumblecore. Flexitarian mumblecore four loko chia, yr meditation Pitchfork Odd Future. Pork belly trust fund banh mi bitters post-ironic, PBR jean shorts cronut listicle four dollar toast Pinterest tilde cred Intelligentsia. VHS letterpress hoodie, migas paleo selvage Banksy biodiesel roof party banjo vegan YOLO tattooed vinyl Vice. You probably haven't heard of them keffiyeh street art, trust fund cray mlkshk Austin tattooed flannel sartorial selvage. Mustache gastropub Tumblr 8-bit kale chips. Godard Pitchfork hashtag tofu PBR&B. Literally umami squid actually chillwave forage, bespoke synth whatever cardigan. Selvage DIY bicycle rights kitsch kale chips Pinterest. Mixtape try-hard Echo Park, tote bag polaroid trust fund sriracha PBR bespoke plaid banjo flexitarian four loko.", 
     							 			origin: "US", 
              		 			image: File.open("#{Rails.root}/app/assets/images/#{n+1}.jpg"),
              		 			allow_other_to_add_songs: [true, false].sample
              		 		 ).save
end

18.times do |n|
		 artist = Artist.all.sample
     artist.songs.build(image: File.open("#{Rails.root}/app/assets/images/#{n+1}.jpg"),
     										title:  Faker::Book.title,
     										genre: SongsController::GENRES.sample,
     										mp3: File.open("#{Rails.root}/app/assets/mp3s/#{SONGS.sample}")
     										).save
end

# artist.songs.each do |song|
# 	song.update_attributes(genre: SongsController::GENRES.sample)
# end