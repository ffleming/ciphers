require 'spec_helper'
RSpec.shared_examples_for "a cipher" do |hash|
  context "#{hash.fetch :name}" do
    let(:alphabet) { hash.fetch(:alphabet, Ciphers::LATIN) }
    let(:ciphertext) { hash.fetch(:ciphertext) }
    let(:plaintext) { hash.fetch(:plaintext) }
    let(:encryptor) { described_class.new(key: hash.fetch(:key), alphabet: alphabet) }

    it "should generate #{hash.fetch :name}" do
      expect(encryptor.encrypt plaintext).to eq ciphertext
    end

    it "should solve #{hash.fetch :name}" do
      expect(encryptor.decrypt ciphertext).to eq plaintext
    end
  end
end
