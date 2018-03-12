class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :date
      t.string :score
      t.string :winning_team

      t.timestamps
    end
  end
end
