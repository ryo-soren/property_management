class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.text :location
      t.text :description
      t.text :amenities
      t.string :image_url
      t.timestamps
    end
  end
end
