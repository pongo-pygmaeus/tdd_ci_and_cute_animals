class AddLeagueIdToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :league_id, :integer
    add_index :teams, :league_id
  end
end
