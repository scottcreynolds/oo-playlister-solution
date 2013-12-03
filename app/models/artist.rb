class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  extend Findable

  def initialize
    super
    @songs = []
  end

  def genres
    songs.collect{|s| s.genre}.flatten.compact.uniq
  end

  def add_songs(songs)
    songs.each do |song|
      add_song(song)
    end
  end

  def add_song(song)
    self.songs << song
    song.artist = self unless song.artist == self
  end

  def url
    "#{name.downcase.gsub(" ", "-")}.html"
  end

end
