class Genre
  attr_accessor :name
  attr_reader :songs
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  extend Findable

  def initialize
    super
    @songs = []
  end

  def artists
    @songs.collect{|s| s.artist}.flatten.compact.uniq
  end

  def url
    "#{name.downcase.gsub(" ", "-")}.html"
  end

end
