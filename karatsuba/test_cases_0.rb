require 'rspec/autorun'
require 'byebug'

require_relative 'karatsuba'

# 2020-06-01 21:15:51 +0200 => 23/34 failures

RSpec.describe self.class do

    subject do
      described_class.send(:karatsuba, x, y)
    end
  
    context 'from course files' do
      filepaths = Dir['../stanford-algs/testCases/course1/assignment1Multiplication/input*.txt']
  
      filepaths.each do |filepath|
        output_filepath = filepath.gsub('input', 'output')
  
        x, y    = File.read(filepath).split("\n")
        product = File.read(output_filepath)
  
        context "#{x} and #{y}" do
          let(:x) { x.to_i }
          let(:y) { y.to_i }
  
          it { is_expected.to eq(product.to_i) }
        end
      end
    end
  
    private
  
    let(:x) { raise 'You must define a let(:x)!' }
    let(:y) { raise 'You must define a let(:y)!' }
  end