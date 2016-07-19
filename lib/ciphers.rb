require "ciphers/version"
require "ciphers/vigenere"
require "ciphers/autokey"

module Ciphers
  LATIN = ('A'..'Z').to_a

  def self.alphabet_from(string)
    raise ArgumentError.new("Argument must be at most #{LATIN.length} characters long") unless string.length <= 26
    chars = string.upcase.chars
    raise ArgumentError.new("Argument must not contain duplicate letters") unless chars.uniq == chars
    if chars.length < 26
      chars + (LATIN - chars)
    else
      chars
    end
  end
end
