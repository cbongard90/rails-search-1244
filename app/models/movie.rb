class Movie < ApplicationRecord
  include PgSearch::Model
  belongs_to :director

  pg_search_scope :search_by_title_and_synopsis,
    against: [:title, :synopsis],
    using: {
      tsearch: { prefix: true }
    }
end
