class CreateProfileLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_links do |t|
      t.string :twitter_url
      t.string :note_url
      t.string :website_url
      t.string :organization
      t.references :user
      t.timestamps
    end
  end
end
