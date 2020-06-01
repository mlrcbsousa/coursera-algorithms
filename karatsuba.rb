require 'rspec/autorun'
require 'byebug'

# Implementation of Karatsuba Multiplication algorithm

# Sudo-code
#
# For the product of 2 integers x and y of length n
# that can be represented in the following way
# x = 10^(n/2) * a + b
# y = 10^(n/2) * c + d
#
# The following steps will produce the product
# step 1 - a * c = S1 
# step 2 - b * d = S2
# step 3 - (a + b)(c + d) = S3
# step 4 - S3 - S2 - S1 = S4
# step 5 -      S1 * 10^n
#           +   S2
#           +   S4 * 10^(n/2)
#           =   Product

# First Implementation 
#
#   Assumptions
# - both x and y have the same length n   # can't once you get to recursion
# - the length n is a power of 2          # can't once you get to recursion
#
#   Restrictions
# - only multiply single digit integers

def karatsuba(x, y)
  x_s = x.to_s
  y_s = y.to_s
  n_x = x_s.length
  n_y = y_s.length
  return x * y if n_x == 1 && n_y == 1 # base case

  # x and y have the same length
  n = n_x
  # debugger
  # Pad zeros on the smaller length number
  if n_x != n_y
    dn = (n_x - n_y).abs

    if n_x < n_y
      n = n_y                 # Gotcha number 3 (using the max but not padding)
      x_s = '0' * dn + x_s
    elsif n_x > n_y
      y_s = '0' * dn + y_s
    end
  end

  h = n/2             # Gotcha number 2
  o = h - 1                 # Gotcha number 1

  # x = 10^(n/2) * a + b
  # y = 10^(n/2) * c + d
  a = x_s[0..o].to_i
  b = x_s[h..].to_i
  c = y_s[0..o].to_i
  d = y_s[h..].to_i

  # step 1
  s1 = karatsuba(a, c)

  # step 2
  s2 = karatsuba(b, d)

  # step 3
  s3 = karatsuba((a + b), (c + d))

  # step 4
  s4 = s3 - s2 - s1

  # step 5
  (s1 * 10**n) + s2 + (s4 * 10**(h + n%2))  # no clue why this works
end


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