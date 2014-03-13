class CD
  @@library = []

  attr_reader :artist, :album_name

  def initialize(artist_name, album_name)
    @artist = Artist.create(artist_name)
    @album_name = album_name
    @artist.add_cd(self)
    @artist
  end

  def self.create(artist_name, album_name)
    new_cd = self.new(artist_name, album_name)
    new_cd.save
    new_cd
  end

  def save
    CD.all << self
    CD.all.sort! do |x, y|
      x.artist.name <=> y.artist.name
    end
  end

  def self.all
    @@library
  end

  def self.clear
    @@library = []
  end
end













