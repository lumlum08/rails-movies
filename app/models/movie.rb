class Movie < ApplicationRecord
  has_many :bookmarks

  include PgSearch::Model

  TITLE = Movie.all.map { |movie| movie.title }.uniq

  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  validates :title, :overview, uniqueness: true, presence: true
end
