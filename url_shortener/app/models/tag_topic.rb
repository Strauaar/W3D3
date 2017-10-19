class TagTopic < ApplicationRecord
  validates :topic, unique: true

  has_many :url_tagging,
  primary_key: :id,
  class_name: 'Tagging',
  foreign_key: :topic_id

  has_many :short_links,
  through: :url_tagging,
  source: :shortened_url

  def popular_links
    short_links.order(short_links.count(self['id']) )

  end



end
