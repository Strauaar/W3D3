class Visit < ApplicationRecord
  attr_accessor :created_at
  belongs_to :users,
  primary_key: :id,
  class_name: 'User',
  foreign_key: :user_id

  belongs_to :shortened_urls,
  primary_key: :id,
  class_name: 'ShortenedUrl',
  foreign_key: :shortened_url_id



  def self.record_visit!(user,shortened_url)
    Visit.create!(user_id: user[:id], shortened_url_id: shortened_url[:id])
  end



end
