class Song
  def initialize(animals)
    @animals = animals
  end

  def sing
    <<-HEREDOC
There was an old lady who swallowed #{indefinite_determiner(0)} #{name(0)}.
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed #{indefinite_determiner(1)} #{name(1)};
#{remark(1)}.
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed a bird;
How absurd to swallow a bird.
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed a cat;
Fancy that to swallow a cat!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed a dog;
What a hog, to swallow a dog!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed a cow;
I don't know how she swallowed a cow!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{name(1)},
She swallowed the #{name(1)} to catch the #{name(0)};
I don't know why she swallowed #{indefinite_determiner(0)} #{name(0)} - perhaps she'll die!
There was an old lady who swallowed a horse...
...She's dead, of course!
    HEREDOC
  end

  private

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

song = Song.new(
  [
    { name: 'fly', indefinite_determiner: 'a' },
    { name: 'spider', indefinite_determiner: 'a', remark: 'That wriggled and wiggled and tickled inside her' },
  ]
).sing
puts song

