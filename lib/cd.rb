class CD
  @@library = []

  attr_reader :artist_name, :album_name

  def initialize(artist_name, album_name)
    @artist_name = artist_name
    @album_name = album_name
  end

  def self.create(artist_name, album_name)
    new_cd = self.new(artist_name, album_name)
    new_cd.save
    new_cd
  end

  def save
    CD.all << self
    CD.all.sort! do |x, y|
      x.artist_name <=> y.artist_name
    end
  end

  def self.all
    @@library
  end

  def self.clear
    @@library = []
  end
end
