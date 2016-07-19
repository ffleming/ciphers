require 'spec_helper'
describe Ciphers::Autokey do
  it_should_behave_like "a cipher",
    name: "Practical Cryptography", plaintext: "DEFENDTHEEASTWALLOFTHECASTLE",
    ciphertext: "ISWXVIBJEXIGGZEQPBIMOIGAKMHE", key: "FORTIFICATION"

  it_should_behave_like "a cipher",
    name: "Wikipedia 1", plaintext: "MEETATTHEFOUNTAIN",
    ciphertext: "WMPMMXXAEYHBRYOCA", key: "KILT"

  it_should_behave_like "a cipher",
    name: "Wikipedia 2", plaintext: "ATTACKATDAWN",
    ciphertext: "QNXEPVYTWTWP", key: "QUEENLY"
end
