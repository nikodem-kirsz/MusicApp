class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.string :origin
      t.string :genres

      t.timestamps null: false
    end
  end
end
