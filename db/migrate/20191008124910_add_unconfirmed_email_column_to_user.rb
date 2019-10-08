class AddUnconfirmedEmailColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_columns :users, :unconfirmed_email,:string
  end
end
