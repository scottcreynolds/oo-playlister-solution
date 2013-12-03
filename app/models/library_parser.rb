class LibraryParser
  attr_writer :files
  attr_reader :path

  def self.parse
    new.call
  end

  def initialize(path = "db/data")
    @path = path
  end

  def build_song(artist_name, song_name, genre_name)
    Song.new.tap do |s|
      s.name = song_name
      s.artist = Artist.find_or_create_by_name(artist_name)
      s.genre = Genre.find_or_create_by_name(genre_name)
    end
  end

  def files
    @files ||= Dir.entries(path)[2..-1]
  end

  def call
    files.each do |file_name|
      build_song(*parse_filename(file_name))
    end
  end

  def parse_filename(file_name)
    file_name.gsub("].mp3", "").split(" - ").join(" [").split(" [")
  end
end
