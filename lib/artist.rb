class Artist
  @@artist_list = []

  attr_reader :name, :cds

  def initialize(name)
    @name = name
    @cds = []
  end

  def save
    Artist.all << self
    Artist.all.sort! do |x, y|
      x.name <=> y.name
    end
  end

  def add_cd(cd)
    @cds << cd
    @cds.sort! do |x, y|
      x.album_name <=> y.album_name
    end
  end

  def self.create(name)
    redundant_artist = Artist.all.bsearch do |artist|
      name == artist.name
    end

    if redundant_artist.nil?
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    else
      redundant_artist
    end
  end

  def self.all
    @@artist_list
  end

  def self.clear
    @@artist_list = []
  end

end
