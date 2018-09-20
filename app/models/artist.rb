class Artist < ActiveRecord::Base
 has_many :songs
 has_many :genres, through: :songs

 def slug
   name.downcase.tr(" ", "-")
 end

 def self.find_by_slug(slug_input)
   all = Artist.all
   slug_artist = all.select {|artist| artist.slug == slug_input}
   slug_artist[0]
 end
end
