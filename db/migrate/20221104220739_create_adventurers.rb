class CreateAdventurers < ActiveRecord::Migration[7.0]
  def change
    create_table :adventurers do |t|
      t.string :name
      t.string :race
      t.string :alignment
      t.string :city
      t.string :primary_weapon
      t.string :secondary_weapon

      t.timestamps
    end
  end
end
