class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :score
      t.integer :played
      t.integer :rank
      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
