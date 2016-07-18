module Ciphers
	LATIN = ('A'..'Z').to_a

	class Vigenere
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

		def initialize(alphabet: Ciphers::LATIN, key: )
      alphabet = alphabet.chars if alphabet.is_a? String
			@alphabet = alphabet.to_a.freeze
      @key = key.upcase.freeze
		end

		def encrypt(string)
      i = 0
      string.each_char.with_object('') do |char, ret|
        ret << char and next unless alphabet.include?(char)
        key_char = key[ i % key.length ]
				row = table.fetch key_char
				col = alphabet.index(char)
        i += 1
				ret << row[col]
			end
		end

    def decrypt(string)
      i = 0
      string.each_char.with_object('') do |char, ret|
        ret << char and next unless alphabet.include?(char)
        key_char = key[ i % key.length ]
        row = table.fetch key_char
        col = row.index(char)
        i += 1
        ret << alphabet[col]
      end
    end

		private

		attr_reader :alphabet, :key

		def table
			@table = {}.tap do |hash|
				alphabet.each_with_index {|char, i| hash[char] = alphabet.rotate(i) }
			end
		end
	end

end
