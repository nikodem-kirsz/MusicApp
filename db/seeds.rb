SONGS = ["heartbreaker.mp3", "moby_dick.mp3", "radio.mp3"]

if !User.find_by(email: "example1@musicapp.com")
  18.times do |n|
    User.create!(email: "example#{n}@musicapp.com", password: "password")
  end
end

def unique_name
  name = Faker::App.name
  while Artist.find_by(name: name)
    name = Faker::App.name
  end
  return name
end


  18.times do |n|
       user = User.all.sample
       user.artists.build(name: unique_name,
                          description: "Tousled flexitarian distillery tote bag drinking vinegar, wolf vinyl synth letterpress you probably haven't heard of them tilde. Wolf DIY distillery irony Carles mumblecore. Flexitarian mumblecore four loko chia, yr meditation Pitchfork Odd Future. Pork belly trust fund banh mi bitters post-ironic, PBR jean shorts cronut listicle four dollar toast Pinterest tilde cred Intelligentsia. VHS letterpress hoodie, migas paleo selvage Banksy biodiesel roof party banjo vegan YOLO tattooed vinyl Vice. You probably haven't heard of them keffiyeh street art, trust fund cray mlkshk Austin tattooed flannel sartorial selvage. Mustache gastropub Tumblr 8-bit kale chips. Godard Pitchfork hashtag tofu PBR&B. Literally umami squid actually chillwave forage, bespoke synth whatever cardigan. Selvage DIY bicycle rights kitsch kale chips Pinterest. Mixtape try-hard Echo Park, tote bag polaroid trust fund sriracha PBR bespoke plaid banjo flexitarian four loko.", 
                          origin: "US", 
                          image: File.open("#{Rails.root}/app/assets/images/#{n+1}.jpg"),
                          allow_other_to_add_songs: [true, false].sample
                         ).save
  end

40.times do |n|
     artist = Artist.all.sample
     artist.songs.build(image: File.open("#{Rails.root}/app/assets/images/#{rand(1..18)}.jpg"),
                        title:  Faker::Book.title,
                        genre: SongsController::GENRES.sample,
                        mp3: File.open("#{Rails.root}/app/assets/mp3s/#{SONGS.sample}")
                        ).save
end