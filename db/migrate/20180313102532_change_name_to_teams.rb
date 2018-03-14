class ChangeNameToTeams < ActiveRecord::Migration[5.1]
  def change
    rename_column :teams, :validate, :valid
  end
end
