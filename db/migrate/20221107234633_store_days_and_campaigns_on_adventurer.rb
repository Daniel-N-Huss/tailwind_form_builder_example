class StoreDaysAndCampaignsOnAdventurer < ActiveRecord::Migration[7.0]
  def change
    add_column :adventurers, :number_of_campaigns, :integer
    add_column :adventurers, :days_adventuring, :integer
  end
end
