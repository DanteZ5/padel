class AddReceiverToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :receiver, :boolean
  end
end
