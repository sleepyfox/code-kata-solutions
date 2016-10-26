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
    <<-HEREDOC
#{verse_preamble(0)}.
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(1)};
#{remark(1)}.
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(2)};
#{remark(2)}.
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(3)};
#{remark(3)}!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(4)};
#{remark(4)}!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(5)};
#{remark(5)}!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
#{verse_preamble(6)}...
#{remark(6)}!
    HEREDOC
  end

  private

  def verse_preamble(animal_index)
    "#{VERSE_PREAMBLE}#{indefinite_determiner(animal_index)} #{name(animal_index)}"
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

