class ChangeAgainNameToTeams < ActiveRecord::Migration[5.1]
  def change
    rename_column :teams, :valid, :accepted
  end
end
