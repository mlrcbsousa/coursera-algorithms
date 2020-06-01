require 'rspec/autorun'
require 'byebug'
# Implementation of Karatsuba Multiplication algorithm

# Sudo-code

# For the product of 2 integers x and y of length n
# that can be represented in the following way
# x = 10^(n/2) * a + b
# y = 10^(n/2) * c + d

# The following steps will produce the product
# step 1 - a * c = S1 
# step 2 - b * d = S2
# step 3 - (a + b)(c + d) = S3
# step 4 - S3 - S2 - S1 = S4
# step 5 -      S1 * 10^n
#           +   S2
#           +   S4 * 10^(n/2)
#           =   Product

def karatsuba(x, y)

    100
end

RSpec.describe self.class do

    subject(:product) do
        described_class.send(:karatsuba, x, y)
    end

    context '10 and 10' do
        let(:x) { 10 }
        let(:y) { 10 }

        it { is_expected.to eq(100) }
    end

    private

    let(:x) { raise 'You must define a let(:x)!' }
    let(:y) { raise 'You must define a let(:y)!' }
end