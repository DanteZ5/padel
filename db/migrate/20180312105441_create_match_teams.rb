class CreateMatchTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :match_teams do |t|
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
