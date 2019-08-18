class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :description, null: false
      t.string :url
      t.boolean :is_pr, defaule: false

      t.timestamps
    end
  end
end
