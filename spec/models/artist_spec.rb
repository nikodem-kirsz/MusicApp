require 'rails_helper'

describe Artist do
    it "does not allow duplicate artist name" do
        breeders = Artist.create(name: 'Breeders',
                                 description: 'description...',
                                 origin: 'Seattle US',
                                 image: File.open("#{Rails.root}/app/assets/images/#{rand(1..31)}.jpg"),
                                 user_id: 1
                               )
        breeders_dup = Artist.new(name: 'Breeders')
        breeders_dup.valid?
        expect(breeders_dup.errors[:name]).to include('has already been taken')
    end

    it "allows to belongs to the same user" do
        breeders = Artist.create(name: 'Breeders',
                                 description: 'description...',
                                 origin: 'Seattle US',
                                 image: File.open("#{Rails.root}/app/assets/images/#{rand(1..31)}.jpg"),
                                 user_id: 1
                               )
        bikini = Artist.new(name: 'Bikini Kill',
                                 description: 'description...',
                                 origin: 'Seattle US',
                                 image: File.open("#{Rails.root}/app/assets/images/#{rand(1..31)}.jpg"),
                                 user_id: 1
                               )
        expect(bikini).to be_valid
        
    end

    it "does not allow for name longer than 60" do
        artist = Artist.new(name: 'a'* 61)
        expect(artist).to be_invalid
    end

    it "does not allow for origin longer than 50" do
        artist = Artist.new(origin: 'a'* 51)
        expect(artist).to be_invalid
    end

    it "requires full data for an artist" do
        artist = Artist.new
        expect(artist.errors[:name]).not_to include("can't be blank")
        expect(artist.errors[:description]).not_to include("can't be blank")
        expect(artist.errors[:origin]).not_to include("can't be blank")
        expect(artist.errors[:image]).not_to include("can't be blank")

        expect(artist).to be_invalid
        artist.update_attributes(name: "John")
        expect(artist).to be_invalid
        artist.update_attributes(description: "blablabla")
        expect(artist).to be_invalid
        artist.update_attributes(origin: "WA")
        expect(artist).to be_invalid
        artist.update_attributes(image: File.open("#{Rails.root}/app/assets/images/1.jpg"))
        expect(artist).to be_invalid
        artist.update_attributes(user_id: 1)
        expect(artist).to be_valid
    end







end