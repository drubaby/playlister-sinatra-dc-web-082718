class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.tr(" ", "-")
  end

  def self.find_by_slug(slug_input)
    all = Song.all
    slug_song= all.select {|song| song.slug == slug_input}
    slug_song[0]
  end

end
