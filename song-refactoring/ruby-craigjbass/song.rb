class Song
  VERSE_PREAMBLE = 'There was an old lady who swallowed '

  def initialize(animals)
    @animals = animals
  end

  def self.original_song
    [
      { name: 'fly', indefinite_determiner: 'a' },
      { name: 'spider', indefinite_determiner: 'a', remark: 'That wriggled and wiggled and tickled inside her' },
      { name: 'bird', indefinite_determiner: 'a', remark: 'How absurd to swallow a bird' },
      { name: 'cat', indefinite_determiner: 'a', remark: 'Fancy that to swallow a cat' },
      { name: 'dog', indefinite_determiner: 'a', remark: 'What a hog, to swallow a dog' },
      { name: 'cow', indefinite_determiner: 'a', remark: "I don't know how she swallowed a cow" },
      { name: 'horse', indefinite_determiner: 'a', remark: "...She's dead, of course" },
    ]
  end

  def sing
    song = ''

    if @animals.length > 0
      song = <<-HEREDOC
#{verse_start(0)}.
#{verse_end}
      HEREDOC
    end

    if @animals.length > 1
      verse = ''
      verse << "#{verse_part(1)};"
      song << <<-HEREDOC
#{verse_start(1)};
#{remark(1)}.
#{verse}
#{verse_end}
      HEREDOC
    end

    if @animals.length > 2
      verse = verse_lines(2)
     song << <<-HEREDOC
#{verse_start(2)};
#{remark(2)}.
#{verse}
#{verse_end}
      HEREDOC
    end

    if @animals.length > 3
      verse = verse_lines(3)
      song << <<-HEREDOC
#{verse_start(3)};
#{remark(3)}!
#{verse}
#{verse_end}
      HEREDOC
    end

    if @animals.length > 4
      verse = ''
      verse << "#{verse_part(4)},\n"
      verse << "#{verse_part(3)},\n"
      verse << "#{verse_part(2)},\n"
      verse << "#{verse_part(1)};"
      song << <<-HEREDOC
#{verse_start(4)};
#{remark(4)}!
#{verse}
#{verse_end}
      HEREDOC
    end

    if @animals.length > 5
      verse = ''
      verse << "#{verse_part(5)},\n"
      verse << "#{verse_part(4)},\n"
      verse << "#{verse_part(3)},\n"
      verse << "#{verse_part(2)},\n"
      verse << "#{verse_part(1)};"
      song << <<-HEREDOC
#{verse_start(5)};
#{remark(5)}!
#{verse}
#{verse_end}
      HEREDOC
    end

    if @animals.length > 6
      song << <<-HEREDOC
#{verse_start(6)}...
#{remark(6)}!
    HEREDOC
    end

    song
  end

  private

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

