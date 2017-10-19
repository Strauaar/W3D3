class Tagging < ApplicationRecord
validates :topic_id, :shortened_url_id, presence: true

  belongs_to :tag_topic,
  primary_key: :id,
  class_name: 'TagTopic',
  foreign_key: :topic_id

  belongs_to :shortened_url,
  primary_key: :id,
  class_name: 'ShortenedUrl',
  foreign_key: :shortened_url_id


end
