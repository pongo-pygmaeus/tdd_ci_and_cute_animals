class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :uniform_color
      t.integer :captain_id

      t.timestamps
    end
    add_index :teams, :captain_id
  end
end
