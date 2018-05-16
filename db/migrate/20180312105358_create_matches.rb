class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.string :score
      t.integer :winning_team

      t.timestamps
    end
  end
end
