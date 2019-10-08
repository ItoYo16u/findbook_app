class AddIndexToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :confirmation_token, unique: true
    remove_columns :users,:unconfirmed_email
  end
end
