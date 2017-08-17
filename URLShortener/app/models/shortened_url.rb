class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.create_shortened_url_for_user!(user, long_url)
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    loop do
      random = SecureRandom.urlsafe_base64(16)
      return random unless ShortenedUrl.exists?(random)
    end
  end


end
