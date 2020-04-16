class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end

def self.new_by_name(song_name)
  song = self.new 
    song.name = song_name
    song.save 
    song
end   

def self.create_by_name (song_name)
  song = self.new
    song.name = song_name
    song.save
    song
  end
  
 def self.find_by_name(this_name)
    Song.all.find {|a_song| a_song.name == this_name}
  end

  def self.find_or_create_by_name(this_name)
    find_by_name(this_name) || create_by_name(this_name)
  end
    
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

def self.new_from_filename(string_to_manipulate)
    parts = string_to_manipulate.split(" - ")
    artist = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.artist_name = artist
    song.name = song_name
    song
  end

  def self.create_from_filename(string_to_manipulate)
    song = new_from_filename(string_to_manipulate)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
end