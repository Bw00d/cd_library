require './lib/cd'

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
  when 'l'
    list_cds
  when 'sr'

  when 'sb'

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
  puts "\"#{album}\" by #{artist} added.\n\n"
  main_menu
end

def list_cds
  CD.all.each { |cd| puts "#{cd.artist_name}: \"#{cd.album_name}\"" }
  puts "\n\n"
  main_menu
end



CD.clear
main_menu


