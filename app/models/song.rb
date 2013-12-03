class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  extend Findable

  def artist=(artist)
    @artist = artist
    artist.songs << self unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def to_s
    "#{artist.name} - #{name} [#{genre.name}]"
  end

  def url
    "#{name.downcase.gsub(" ", "-")}.html"
  end
end