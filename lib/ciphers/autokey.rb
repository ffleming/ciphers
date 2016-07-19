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
        key_char = keystream_for(string)[i]
				row = table.fetch key_char
				col = alphabet.index(char)
				ret << row[col]
			end
		end

    def decrypt(string)
      string.each_char.with_index.with_object('') do |(char, i), ret|
        ret << char and next unless alphabet.include?(char)
        key_char = decryption_keystream[i]
        row = table.fetch key_char
        col = row.index(char)
        ret << alphabet[col]
        decryption_keystream << alphabet[col]
      end
    end

		private

		attr_reader :alphabet, :key

		def table
			@table = {}.tap do |hash|
				alphabet.each_with_index {|char, i| hash[char] = alphabet.rotate(i) }
			end
		end

    def keystream_for(string)
      "#{key}#{string}"[0..(string.length - 1)]
    end

    def decryption_keystream
      @decryption_keystream ||= key.dup
    end
	end

end
