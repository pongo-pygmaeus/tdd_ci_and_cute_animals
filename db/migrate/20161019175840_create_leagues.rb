class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
    add_index :leagues, :creator_id
  end
end
