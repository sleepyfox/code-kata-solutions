class Song
  def initialize(animals)
    @animals = animals
  end

  def sing
    <<-HEREDOC
There was an old lady who swallowed #{first_animal_indefinite_determiner} #{first_animal}.
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed #{second_animal_indefinite_determiner} #{second_animal};
That wriggled and wiggled and tickled inside her.
She swallowed the #{second_animal} to catch the #{first_animal};
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a bird;
How absurd to swallow a bird.
She swallowed the bird to catch the #{second_animal},
She swallowed the #{second_animal} to catch the #{first_animal};
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a cat;
Fancy that to swallow a cat!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{second_animal},
She swallowed the #{second_animal} to catch the #{first_animal};
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a dog;
What a hog, to swallow a dog!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{second_animal},
She swallowed the #{second_animal} to catch the #{first_animal};
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a cow;
I don't know how she swallowed a cow!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the #{second_animal},
She swallowed the #{second_animal} to catch the #{first_animal};
I don't know why she swallowed #{first_animal_indefinite_determiner} #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a horse...
...She's dead, of course!
    HEREDOC
  end



  private

  def first_animal
    @animals.first[:name]
  end

  def first_animal_indefinite_determiner
    @animals.first[:indefinite_determiner]
  end

  def second_animal
    @animals.fetch(1)[:name]
  end

  def second_animal_indefinite_determiner
    @animals.fetch(1)[:indefinite_determiner]
  end
end

song = Song.new(
  [
    { name: 'fly', indefinite_determiner: 'a' },
    { name: 'spider', indefinite_determiner: 'a' },
  ]
).sing
puts song

