class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.integer :team_id
      t.integer :member_id

      t.timestamps
    end
    add_index :memberships, :team_id
    add_index :memberships, :member_id
  end
end
