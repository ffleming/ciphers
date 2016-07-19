module Ciphers
	class Autokey
		def initialize(alphabet: Ciphers::LATIN, key: )
      alphabet = alphabet.chars if alphabet.is_a? String
			@alphabet = alphabet.to_a.freeze
      @key = key.upcase.freeze
		end

		def encrypt(string)
      string.each_char.with_index.with_object('') do |(char, i), ret|
        ret << char and next unless alphabet.include?(char)
        key_char = "#{key}#{string}"[i]
				row = table.fetch key_char
				col = alphabet.index(char)
				ret << row[col]
			end
		end

    def decrypt(string)
      string.each_char.with_index.with_object('') do |(char, i), ret|
        ret << char and next unless alphabet.include?(char)
        key_char = "#{key}#{ret}"[i]
        row = table.fetch key_char
        col = row.index(char)
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
