class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :origin
      t.string :genres

      t.timestamps null: false
    end
  end
end
