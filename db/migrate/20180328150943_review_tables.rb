class ReviewTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :match_teams
    add_column :matches, :team_1_id, :integer, :references => "teams"
    add_column :matches, :team_2_id, :integer, :references => "teams"
    remove_column :teams, :status
  end
end
