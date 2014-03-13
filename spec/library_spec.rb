require 'cd'
require 'artist'
require 'rspec'

describe CD do
  before do
    CD.clear
  end

  describe '#initialize' do
    it 'initializes the instance variables artist_name and album_name' do
      test_cd = CD.new('Pink Floyd', 'Darkside of the Moon')
      test_cd.should be_an_instance_of CD
    end
  end

  describe '#save' do
    it 'adds self to @@library' do
      test_cd = CD.new('Pink Floyd', 'Darkside of the Moon')
      test_cd.save
      CD.all.should eq [test_cd]
    end
  end

  describe '.create' do
    it 'initializes a new CD instance' do
      test_cd = CD.create('Pink Floyd', 'Darkside of the Moon')
      test_cd.should be_an_instance_of CD
    end

    it 'saves it to @@library' do
      test_cd = CD.create('Pink Floyd', 'Darkside of the Moon')
      CD.all.should eq [test_cd]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      CD.all.should eq []
    end
  end

  describe '.clear' do
    it 'empties out all of the saved items from the array' do
      CD.create('Pink Floyd', 'Darkside of the Moon')
      CD.clear
      CD.all.should eq []
    end
  end
end

describe Artist do
  before do
    Artist.clear
  end

  describe '#initialize' do
    it 'initializes an Artist instance' do
      test_artist = Artist.new('Pink Floyd')
      test_artist.should be_an_instance_of Artist
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Artist.all.should eq []
    end
  end

  describe '.create' do
    it 'initializes a new Artist instance' do
      test_artist = Artist.create('Pink Floyd')
      test_artist.should be_an_instance_of Artist
    end

    it 'saves it to @@artist_list' do
      test_artist = Artist.create('Pink Floyd')
      Artist.all.should eq [test_artist]
    end
  end

  describe '.clear' do
    it 'empties out all of the saved items from the array' do
      Artist.create('Pink Floyd')
      Artist.clear
      Artist.all.should eq []
    end
  end
end
