#given a graph, output each level of friends.
#each friend should only be output once, at the first level they are encountered.

=begin
INPUT
2 # number of lines to follow
A:B,C,D # member a has friends b,c,d
A # the member to start the traversal from.

OUTPUT
=end

require 'social_graph'

describe "problem" do
  subject { SocialGraph.new(input, output) }
  let(:output) { StringIO.new }

  context "when 2 lines given" do 
    let(:fixtures_dir) { File.join(Dir.pwd, 'spec', 'fixtures') }
    let(:input) { StringIO.new(IO.read(File.join(fixtures_dir, "input001.txt"))) }
    let(:expected) { IO.read(File.join(fixtures_dir, "output001.txt")) }

    it 'writes the correct result' do
      subject.run
      output.rewind
      expect(output.read).to eql(expected)
    end
  end

  context "when 4 lines given" do
    let(:fixtures_dir) { File.join(Dir.pwd, 'spec', 'fixtures') }
    let(:input) { StringIO.new(IO.read(File.join(fixtures_dir, "input002.txt"))) }
    let(:expected) { IO.read(File.join(fixtures_dir, "output002.txt")) }

    it 'writes the correct result' do
      subject.run
      output.rewind
      expect(output.read).to eql(expected)
    end
  end

  context "when 7 lines given" do
    let(:fixtures_dir) { File.join(Dir.pwd, 'spec', 'fixtures') }
    let(:input) { StringIO.new(IO.read(File.join(fixtures_dir, "input000.txt"))) }
    let(:expected) { IO.read(File.join(fixtures_dir, "output000.txt")) }

    it 'writes the correct result' do
      subject.run
      output.rewind
      expect(output.read).to eql(expected)
    end
  end
end
