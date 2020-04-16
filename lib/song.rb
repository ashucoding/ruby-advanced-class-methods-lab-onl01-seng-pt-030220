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
  
  def self.find_by_name (song_name)
   self.all.detect {|i| i.name == song_name}
  end
  
  def self.find_or_create_by_name(play_this_song)
    alexa_find_it = self.all.detect {|x| x.name == play_this_song}
    if alexa_find_it == nil
      song = self.new 
      song.name = play_this_song
      song.save 
      song
    else
      alexa_find_it
    end
  end
    
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 

def self.new_from_filename(mp3_formatted_file)
    create = self.new 
    create.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    create.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    create
  end 
  
   def self.create_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
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