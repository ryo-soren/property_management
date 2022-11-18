class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :occupants
      t.string :sin
      t.string :phone_number
      t.text :content
      t.timestamps
    end
  end
end
