class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.string :tag_topic_id,  NULL: false
      t.string :shortened_url_id, NULL: false
      t.timestamps
    end
  end
end
