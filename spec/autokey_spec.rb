require 'spec_helper'
describe Ciphers::Autokey do
  it_should_behave_like "a cipher",
    name: "Practical Cryptography", plaintext: "DEFENDTHEEASTWALLOFTHECASTLE",
    ciphertext: "ISWXVIBJEXIGGZEQPBIMOIGAKMHE", key: "FORTIFICATION"
end
