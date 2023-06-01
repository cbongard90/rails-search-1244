class Movie < ApplicationRecord
  include PgSearch::Model
  searchkick
  belongs_to :director

  multisearchable against: [:title, :synopsis]

  # pg_search_scope :global_search,
  #   against: [:title, :synopsis],
  #   associated_against: {
  #     director: [ :first_name, :last_name ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
