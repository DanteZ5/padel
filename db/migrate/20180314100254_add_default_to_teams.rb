class AddDefaultToTeams < ActiveRecord::Migration[5.1]
  def change
    change_column_default :teams, :score, 0
    change_column_default :teams, :played, 0
    change_column_default :teams, :rank, 0
  end
end
