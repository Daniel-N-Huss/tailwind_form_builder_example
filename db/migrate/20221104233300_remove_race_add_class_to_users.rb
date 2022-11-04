class RemoveRaceAddClassToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :adventurers, :race, :klass
  end
end
