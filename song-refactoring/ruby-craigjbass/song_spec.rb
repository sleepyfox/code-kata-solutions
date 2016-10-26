require_relative 'song'
RSpec.describe Song do
  subject { described_class.new(Song.original_song).sing }

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
    let(:song) { [] }
    before { song << first_animal }
    subject { described_class.new(song).sing }

    let(:first_animal) { { indefinite_determiner: 'an', name: 'ant' } }
    it 'sings about the old lady swallowing an ant' do
      is_expected.to include('There was an old lady who swallowed an ant.')
      is_expected.to include("I don't know why she swallowed an ant - perhaps she'll die!")

      is_expected.to_not include('fly')
    end

    it 'uses the correct indefinite determiner' do
      is_expected.not_to include('a ant')
    end

    context 'given second animal is an aphid' do
      before { song << second_animal }
      let(:second_animal) do
        { indefinite_determiner: 'an',
          name: 'aphid',
          remark: 'That chomped and ate and wrecked havoc inside her' }
      end
      it 'sings about the old lady swallowing an aphid' do
        is_expected.to include('There was an old lady who swallowed an aphid...')

        is_expected.not_to include('spider')
      end

      it 'uses the correct remark' do
        is_expected.to include(second_animal[:remark])
        is_expected.not_to include('wriggled and wiggled and tickled')
      end

      it 'uses the correct indefinite determiner' do
        is_expected.not_to include('a aphid')
      end

      context 'given third animal is an elephant' do
        before { song << third_animal }
        let(:third_animal) do
          { indefinite_determiner: 'an',
            name: 'elephant',
            remark: "She's dead dave." }
        end

        it 'refers back to the first animal' do
          is_expected.to include('She swallowed the aphid to catch the ant;')
        end

        it 'refers back to the second animal' do
          is_expected.to include('She swallowed the aphid to catch')
        end

        it do
          is_expected.to include('There was an old lady who swallowed an aphid;')
          is_expected.to include('There was an old lady who swallowed an elephant...')
          is_expected.to include("She's dead dave.")
        end
      end
    end
  end
end
