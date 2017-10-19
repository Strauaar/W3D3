
class ShortenedUrl < ApplicationRecord
  include SecureRandom

  validates :short_url, uniqueness: true
  validates :long_url, presence: true

  belongs_to :submitter,
  primary_key: :id,
  class_name: 'User',
  foreign_key: :user_id

  has_many :visits,
  primary_key: :id,
  class_name: 'Visit',
  foreign_key: :shortened_url_id

  has_many :visitors,
  through: :visits,
  source: :users

  def num_clicks
    visits.length
  end

  def num_uniques
    hash = Hash.new(0)
    visits.each do |visit|
      hash[visit.user_id] = 0
    end
    hash.keys.count
  end

  def recent_uniques
    visits.where(:created_at > (Time.now - 600))
  end

  def self.random_code
    code = SecureRandom::urlsafe_base64
    until !self.exists?(short_url: code)
      code = SecureRandom::urlsafe_base64
    end
    code
  end

  def self.god_mode(user, long_url)
    ShortenedUrl.create!(user_id: user[:id], long_url: long_url, short_url: ShortenedUrl.random_code)
  end
end
