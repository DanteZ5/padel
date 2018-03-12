class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :team, foreign_key: true
    add_column :users, :admin, :boolean
  end
end
