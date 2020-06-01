require 'rspec/autorun'
require 'byebug'

require_relative 'karatsuba'

RSpec.describe self.class do

    subject do
      described_class.send(:karatsuba, x, y)
    end
  
    context '7 and 9' do
      let(:x) { 7 }
      let(:y) { 9 }
  
      it { is_expected.to eq(63) }
    end
  
    context '12 and 56' do
      let(:x) { 12 }
      let(:y) { 56 }
  
      it { is_expected.to eq(672) }
    end
  
    context '34 and 78' do
      let(:x) { 34 }
      let(:y) { 78 }
  
      it { is_expected.to eq(2652) }
    end
  
    context '46 and 134' do
      let(:x) { 46 }
      let(:y) { 134 }
  
      it { is_expected.to eq(6164) }
    end
  
    context '134 and 46' do
      let(:x) { 134 }
      let(:y) { 46 }
  
      it { is_expected.to eq(6164) }
    end
  
    context '1234 and 5678' do
      let(:x) { 1234 }
      let(:y) { 5678 }
  
      it { is_expected.to eq(7006652) }
    end
  
    private
  
    let(:x) { raise 'You must define a let(:x)!' }
    let(:y) { raise 'You must define a let(:y)!' }
  end