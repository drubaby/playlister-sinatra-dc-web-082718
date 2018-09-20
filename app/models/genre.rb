class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.tr(" ", "-")
  end

  def self.find_by_slug(slug_input)
    all = Genre.all
    slug_genre = all.select {|genre| genre.slug == slug_input}
    slug_genre[0]
  end

end
