require './lib/cd'
require './lib/artist'

def prompt
  print '> '
end

def main_menu
  puts 'Choose option from menu:'
  puts "\ta: add new CD"
  puts "\tl: list all CDs"
  puts "\tsr: search by artist"
  puts "\tsb: search by album name"
  puts "\tx: exit program"
  prompt
  choice = gets.chomp

  case choice
  when 'a'
    add_cd
    main_menu
  when 'l'
    list_cds
    main_menu
  when 'sr'
    search_by_artist
    main_menu
  when 'sb'
    search_by_album
    main_menu
  when 'x'
    puts 'Goodbye!'
  else
    puts 'Invalid option!'
    main_menu
  end
end

def add_cd
  puts 'Enter artist name:'
  prompt
  artist = gets.chomp
  puts 'Enter album name:'
  prompt
  album = gets.chomp
  new_cd = CD.create(artist, album)
  puts "\"#{new_cd.album_name}\" by #{new_cd.artist.name} added.\n\n"
end

def list_cds
  Artist.all.each do |artist|
    puts "#{artist.name}:"
    artist.cds.each do |album|
      puts "\t#{album.album_name}"
    end
  end
  puts "\n\n"
end

def search_by_artist
  puts "Enter the name of an artist to see the albums:"
  prompt
  artist_name = gets.chomp
  albums = CD.all.select do |album|
    album.artist.name == artist_name
  end

  if albums.empty?
    puts "No albums by that artist!"
  else
    puts "#{artist_name}:"
    albums.each do |album|
      puts "\t\"#{album.album_name}\""
    end
  end
  puts "\n\n"
end

def search_by_album
  puts "Enter the album name to see the artist(s):"
  prompt
  album_name = gets.chomp
  albums = CD.all.select do |album|
    album.album_name == album_name
  end

  if albums.empty?
    puts "Album not found!"
  else
    puts "\"#{album_name}\" is by:"
    albums.each do |album|
      puts "#{album.artist.name}"
    end
  end
  puts "\n\n"
end



CD.clear
main_menu


