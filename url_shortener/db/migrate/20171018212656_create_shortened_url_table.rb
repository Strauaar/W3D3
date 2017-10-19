class CreateShortenedUrlTable < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url
      t.string :long_url, null: false
      t.integer :user_id
    end

    add_index :shortened_urls, :short_url, unique: true
  end
end
