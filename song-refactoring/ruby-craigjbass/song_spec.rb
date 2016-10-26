require_relative 'song'
RSpec.describe Song do
  subject { described_class.new([first_animal, second_animal]).sing }
  let(:first_animal) { { indefinite_determiner: 'a', name: 'fly' } }
  let(:second_animal) { { indefinite_determiner: 'a', name: 'spider' } }

  context 'given first animal is fly and second animal is spider' do
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
  context 'given first animal is an ant' do
    let(:first_animal) { { indefinite_determiner: 'an', name: 'ant' } }
    it 'sings about the old lady swallowing an ant' do
      is_expected.to include('There was an old lady who swallowed an ant.')
      is_expected.to_not include('There was an old lady who swallowed a fly.')

      is_expected.to include('She swallowed the spider to catch the ant;')
      is_expected.to_not include('She swallowed the spider to catch the fly;')

      is_expected.to include("I don't know why she swallowed an ant - perhaps she'll die!")
      is_expected.to_not include("I don't know why she swallowed a fly - perhaps she'll die!")
    end
    context 'given second animal is an aphid' do
      let(:second_animal) { { indefinite_determiner: 'an', name: 'aphid' } }
      it 'sings about the old lady swallowing an ant' do
        is_expected.to include('There was an old lady who swallowed an aphid;')
        is_expected.not_to include('There was an old lady who swallowed a spider;')


        is_expected.to include('She swallowed the aphid to catch')
        is_expected.not_to include('She swallowed the spider to catch')

        is_expected.to include('to catch the aphid')
        is_expected.not_to include('to catch the spider')

        is_expected.not_to include('a aphid')
      end
    end
  end
end
