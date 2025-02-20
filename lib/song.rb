require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    split_song = filename.split(" - ")

    song = self.new
    song.name = split_song[1].gsub(".mp3", "")
    song.artist_name = split_song[0]
    song
  end

  def self.create_from_filename(filename)
    split_song = filename.split(" - ")

    song = self.create
    song.name = split_song[1].gsub(".mp3", "")
    song.artist_name = split_song[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
