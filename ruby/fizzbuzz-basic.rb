#!/usr/bin/env ruby
# frozen_string_literal: true

# Implements a basic FizzBuzz solution.
# Prioritizes readability over optimization.

# https://rosettacode.org/wiki/FizzBuzz

LOWER_BOUND = 1   #inclusive
UPPER_BOUND = 100

FIZZ_STRING = 'Fizz'
BUZZ_STRING = 'Buzz'

FIZZ_DIVIZOR = 3
BUZZ_DIVIZOR = 5

def main
  LOWER_BOUND.upto(UPPER_BOUND).each do |element|
    line = line(element)
    puts(line)
  end
end

def line(element)
  fizzable = divisible?(element, FIZZ_DIVIZOR)
  buzzable = divisible?(element, BUZZ_DIVIZOR)

  case
  when fizzable && buzzable
    FIZZ_STRING + BUZZ_STRING
  when fizzable
    FIZZ_STRING
  when buzzable
    BUZZ_STRING
  else
    element
  end
end

def divisible?(candidate, divizor)
  candidate % divizor == 0
end

main
