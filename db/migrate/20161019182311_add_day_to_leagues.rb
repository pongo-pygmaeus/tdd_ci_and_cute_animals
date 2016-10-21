class AddDayToLeagues < ActiveRecord::Migration[5.0]
  def change
    add_column :leagues, :day, :string
  end
end
