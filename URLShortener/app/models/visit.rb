class Visit < ApplicationRecord

  belongs_to :visitor,
    foreign_key: :visitor_id,
    primary_key: :id,
    class_name: :User

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id,
    visited_url: shortened_url)
  end


end
