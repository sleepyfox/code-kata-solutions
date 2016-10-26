class Song
  VERSE_PREAMBLE = 'There was an old lady who swallowed '

  def initialize(animals)
    @animals = animals
  end

  def self.original_song
    [
      { name: 'fly', indefinite_determiner: 'a' },
      { name: 'spider', indefinite_determiner: 'a', remark: 'That wriggled and wiggled and tickled inside her.' },
      { name: 'bird', indefinite_determiner: 'a', remark: 'How absurd to swallow a bird.' },
      { name: 'cat', indefinite_determiner: 'a', remark: 'Fancy that to swallow a cat!' },
      { name: 'dog', indefinite_determiner: 'a', remark: 'What a hog, to swallow a dog!' },
      { name: 'cow', indefinite_determiner: 'a', remark: "I don't know how she swallowed a cow!" },
      { name: 'horse', indefinite_determiner: 'a', remark: "...She's dead, of course!" },
    ]
  end

  def sing
    song = ''
    song << song_start if has_animals?
    return song if @animals.length < 2
    song << song_middle if has_middle_of_song?
    song << song_end
    song
  end

  private

  def song_start
    <<-HEREDOC
#{verse_start(0)}.
#{verse_end}
    HEREDOC
  end

  def song_middle
    song_middle = ''
    last_middle_animal = @animals.length-2
    (1..last_middle_animal).each do |animal_index|
      song_middle << <<-HEREDOC
#{verse_start(animal_index)};
#{remark(animal_index)}
#{verse_lines(animal_index)}
#{verse_end}
      HEREDOC
    end
    song_middle
  end

  def song_end
    <<-HEREDOC
#{verse_start(@animals.length-1)}...
#{remark(@animals.length-1)}
    HEREDOC
  end

  def has_middle_of_song?
    (@animals.length - 2) > 0
  end

  def has_animals?
    @animals.length > 0
  end

  def verse_lines(verse_number)
    verse = ''
    (1..verse_number).reverse_each do |i|
      end_character = i == 1 ? ';' : ",\n"
      verse << "#{verse_part(i)}#{end_character}"
    end
    verse
  end

  def verse_start(animal_index)
    "#{VERSE_PREAMBLE}#{indefinite_determiner(animal_index)} #{name(animal_index)}"
  end

  def verse_part(swallowed_animal_index)
    "She swallowed the #{name(swallowed_animal_index)} to catch the #{name(swallowed_animal_index-1)}"
  end

  def verse_end
    "I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!"
  end

  def animal(animal_index)
    @animals.fetch(animal_index)
  end

  def name(animal_index)
    animal(animal_index)[:name]
  end

  def indefinite_determiner(animal_index)
    animal(animal_index)[:indefinite_determiner]
  end

  def remark(animal_index)
    animal(animal_index)[:remark]
  end
end

song = Song.new(Song.original_song).sing
puts song

