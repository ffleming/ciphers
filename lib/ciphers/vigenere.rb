module Ciphers
	class Vigenere
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
