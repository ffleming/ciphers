require 'spec_helper'
require 'pry-byebug'

shared_examples_for "vigenere" do |hash|
  context "#{hash.fetch :name} challenge" do
    let(:alphabet) { hash.fetch(:alphabet, Ciphers::LATIN) }
    let(:ciphertext) { hash.fetch(:ciphertext) }
    let(:plaintext) { hash.fetch(:plaintext) }
    let(:encryptor) { Ciphers::Vigenere.new(key: hash.fetch(:key), alphabet: alphabet) }

    it "should generate #{hash.fetch :name}" do
      expect(encryptor.encrypt plaintext).to eq ciphertext
    end

    it "should solve #{hash.fetch :name}" do
      expect(encryptor.decrypt ciphertext).to eq plaintext
    end
  end
end

describe Ciphers::Vigenere do
  it_should_behave_like "vigenere",
    name: "Wikipedia", key: "LEMON", ciphertext: "LXFOPVEFRNHR", plaintext: "ATTACKATDAWN"

  it_should_behave_like "vigenere",
    name: "Kryptos 1", key: "PALIMPSEST", alphabet: Ciphers::Vigenere.alphabet_from("KRYPTOS"),
    ciphertext: "EMUFPHZLRFAXYUSDJKZLDKRNSHGNFIVJYQTQUXQBQVYUVLLTREVJYQTMKYRDMFD",
    plaintext: "BETWEENSUBTLESHADINGANDTHEABSENCEOFLIGHTLIESTHENUANCEOFIQLUSION"

  it_should_behave_like "vigenere",
    name: "Kryptos 2", key: "ABSCISSA", alphabet: Ciphers::Vigenere.alphabet_from("KRYPTOS"),
    ciphertext: ( "VFPJUDEEHZWETZYVGWHKKQETGFQJNCEGGWHKK?DQMCPFQZDQMMIAGPFXHQRLG"  +
                 "TIMVMZJANQLVKQEDAGDVFRPJUNGEUNAQZGZLECGYUXUEENJTBJLBQCRTBJDFHRR" +
                 "YIZETKZEMVDUFKSJHKFWHKUWQLSZFTIHHDDDUVH?DWKBFUFPWNTDFIYCUQZERE"  +
                 "EVLDKFEZMOQQJLTTUGSYQPFEUNLAVIDXFLGGTEZ?FKZBSFDQVGOGIPUFXHHDRKF" +
                 "FHQNTGPUAECNUVPDJMQCLQUMUNEDFQELZZVRRGKFFVOEEXBDMVPNFQXEZLGRE"   +
                 "DNQFMPNZGLFLPMRJQYALMGNUVPDXVKPDQUMEBEDMHDAFMJGZNUPLGEWJLLAETG"),
    plaintext: ("ITWASTOTALLYINVISIBLEHOWSTHATPOSSIBLE?THEYUSEDTHEEARTHSMAGNET"   +
                "ICFIELDXTHEINFORMATIONWASGATHEREDANDTRANSMITTEDUNDERGRUUNDTOANU" +
                "NKNOWNLOCATIONXDOESLANGLEYKNOWABOUTTHIS?THEYSHOULDITSBURIEDOUT"  +
                "THERESOMEWHEREXWHOKNOWSTHEEXACTLOCATION?ONLYWWTHISWASHISLASTMES" +
                "SAGEXTHIRTYEIGHTDEGREESFIFTYSEVENMINUTESSIXPOINTFIVESECONDSNO"   +
                "RTHSEVENTYSEVENDEGREESEIGHTMINUTESFORTYFOURSECONDSWESTIDBYROWS")
end
