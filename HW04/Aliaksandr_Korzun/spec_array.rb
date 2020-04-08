require_relative 'array'

RSpec.describe User do
  subject { described_class.new(%w[a b c])}

  describe '#my_each' do
    it 'return source array' do
      expect(subject.my_each{|element| element * 2}).to eql(subject)
    end
  end

  describe '#my_map' do
    it 'return new array' do
      expect(subject.my_map{|element| element * 2}).to eql(["aa", "bb", "cc"])
    end
  end

  describe '#my_select' do
    it 'return an array satisfying the condition' do
      expect(subject.my_select{|element| element == 'a' }).to eql(["a"])
    end
  end
end
