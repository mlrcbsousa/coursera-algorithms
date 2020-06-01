require 'rspec/autorun'
require 'byebug'

require_relative 'karatsuba'

RSpec.describe self.class do

    subject do
      described_class.send(:karatsuba, x, y)
    end

    context '50 and 83' do
      let(:x) { 50 }
      let(:y) { 83 }
  
      it { is_expected.to eq(4150) }
    end
    
    context '77 and 19' do
      let(:x) { 77 }
      let(:y) { 19 }
  
      it { is_expected.to eq(1463) }
    end
    
    context '127 and 102' do
      let(:x) { 127 }
      let(:y) { 102 }
  
      it { is_expected.to eq(12954) }
    end
  
    context '5077 and 8319' do
      let(:x) { 5077 }
      let(:y) { 8319 }
  
      it { is_expected.to eq(42235563) }
    end
  
    private
  
    let(:x) { raise 'You must define a let(:x)!' }
    let(:y) { raise 'You must define a let(:y)!' }
  end