class Song
  def initialize(animal)
    @animal = animal
  end

  def sing
    <<-HEREDOC
There was an old lady who swallowed a #{first_animal}.
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a spider;
That wriggled and wiggled and tickled inside her.
She swallowed the spider to catch the #{first_animal};
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a bird;
How absurd to swallow a bird.
She swallowed the bird to catch the spider,
She swallowed the spider to catch the #{first_animal};
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a cat;
Fancy that to swallow a cat!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the #{first_animal};
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a dog;
What a hog, to swallow a dog!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the #{first_animal};
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a cow;
I don't know how she swallowed a cow!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the #{first_animal};
I don't know why she swallowed a #{first_animal} - perhaps she'll die!
There was an old lady who swallowed a horse...
...She's dead, of course!
    HEREDOC
  end

  private

  def first_animal
    @animal
  end
end

song = Song.new('fly').sing
puts song

