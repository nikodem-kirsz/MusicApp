require 'rails_helper'

describe Song do
    it "is invalid with a missing title and then is being corrected" do
        song = Song.new(
            title: nil
        )
        song.valid?
        expect(song.errors[:title]).to include("can't be blank")
        # expect(song).not_to be_valid
        song.update_attributes(title: "drain you")
        song.valid?
        expect(song.errors[:title]).not_to include("can't be blank")
    end

    it "is valid with a title and genre" do
        song = Song.new(
            title: nil,
            genre: "Rock"
        )
        song.valid?
        expect(song.errors[:genre]).not_to include("can't be blank")
        expect(song.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a wrong song format" do
        song = Song.new(
            title: "song",
            image: File.open("#{Rails.root}/app/assets/mp3s/drain_you.mp3")
        )
        expect !song.valid?   
    end

    it "is valid with correct song format" do
        song = Song.new(
            title: "song",
            image: File.open("#{Rails.root}/app/assets/mp3s/drain_you.mp3")
        )
        expect song.valid?    
    end

    it "is invalid with wrong genre" do
        song = Song.new(genre: "blabla")
        song.valid?
        expect(song.errors[:genre]).to include("is not included in the list")
    end

    it "requires full data for a song" do
        song = Song.new
        expect(song.errors[:title]).not_to include("can't be blank")
        expect(song.errors[:genre]).not_to include("can't be blank")
        expect(song.errors[:image]).not_to include("can't be blank")
        expect(song.errors[:mp3]).not_to include("can't be blank")

        expect(song).to be_invalid
        song.update_attributes(title: "automatic")
        expect(song).to be_invalid
        song.update_attributes(genre: "Rock")
        expect(song).to be_invalid
        song.update_attributes(image: File.open("#{Rails.root}/app/assets/images/1.jpg"))
        expect(song).to be_invalid
        song.update_attributes(mp3: File.open("#{Rails.root}/app/assets/mp3s/radio.mp3"))       
        expect(song).to be_invalid
        song.update_attributes(artist_id: 1)
        expect(song).to be_valid
    end

    it "returns songs of a selected genre" do
    end

    it "returns users favorite/liked songs" do
    end

    it "returns most liked songs by all users" do
    end


end