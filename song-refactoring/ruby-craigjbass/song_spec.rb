require_relative 'song'
RSpec.describe Song do
  subject { described_class.new(animal).sing }

  context 'given first animal is fly' do
    let(:animal) { { indefinite_determiner: 'a', name: 'fly' } }
    it 'the old lady should swallow a fly' do
      expected = <<-HEREDOC
There was an old lady who swallowed a fly.
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a spider;
That wriggled and wiggled and tickled inside her.
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a bird;
How absurd to swallow a bird.
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a cat;
Fancy that to swallow a cat!
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a dog;
What a hog, to swallow a dog!
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a cow;
I don't know how she swallowed a cow!
She swallowed the cow to catch the dog,
She swallowed the dog to catch the cat,
She swallowed the cat to catch the bird,
She swallowed the bird to catch the spider,
She swallowed the spider to catch the fly;
I don't know why she swallowed a fly - perhaps she'll die!
There was an old lady who swallowed a horse...
...She's dead, of course!
      HEREDOC
      is_expected.to eq(expected)
    end
  end

  context 'given first animal is ant' do
    let(:animal) { { indefinite_determiner: 'an', name: 'ant' } }
    it 'the old lady should swallow a ant' do
      is_expected.to include('There was an old lady who swallowed a ant.')
      is_expected.to_not include('There was an old lady who swallowed a fly.')

      is_expected.to include('She swallowed the spider to catch the ant;')
      is_expected.to_not include('She swallowed the spider to catch the fly;')

      is_expected.to include("I don't know why she swallowed an ant - perhaps she'll die!")
      is_expected.to_not include("I don't know why she swallowed a fly - perhaps she'll die!")
    end
  end
end
