require_relative '../lib/caesar_cipher.rb'

describe "the letter_caesar_cipher method" do
  it "should return the unique letter encrypted by shifting \"encryption_key\" letters (while cycling and respecting the case) when \"encryption_key\" is an integer between 0 and 26" do
    expect(letter_caesar_cipher("a", 0)).to eq("a")
    expect(letter_caesar_cipher("Z", 26)).to eq("Z")
    expect(letter_caesar_cipher("X", 3)).to eq("A")
    expect(letter_caesar_cipher("b", 3)).to eq("e")
  end

  it "should return nil when the \"encryption_key\" parameter is NOT a natural integer between 0 and 26 or when the \"letter\" parameter is longer than a single character" do
    expect(letter_caesar_cipher("a", -2)).to eq(nil)
    expect(letter_caesar_cipher("Z", 0.5)).to eq(nil)
    expect(letter_caesar_cipher("B", "0")).to eq(nil)
    expect(letter_caesar_cipher("BB", 5)).to eq(nil)
  end

  it "should return the unchanged character when the \"letter\" parameter is NOT a letter in uppercase or lowercase (between 'A' and 'Z' or 'a' and 'z')" do
    expect(letter_caesar_cipher(",", 2)).to eq(",")
    expect(letter_caesar_cipher("?", 0)).to eq("?")
    expect(letter_caesar_cipher("?", 26)).to eq("?")
  end
end

describe "the caesar_cipher method" do
  it "should return phrase encrypted by shifting \"encryption_key\" letters (while cycling and respecting the case) when \"encryption_key\" is an integer between 0 and 26" do
    expect(caesar_cipher(nil, 5)).to eq(nil)
    expect(caesar_cipher("", 5)).to eq("")
    expect(caesar_cipher("A", 5)).to eq("F")
    expect(caesar_cipher(" 20\t   ", 5)).to eq(" 20\t   ")
    expect(caesar_cipher("What? - a string!", 5)).to eq("Bmfy? - f xywnsl!")
    expect(caesar_cipher("The quick brown FOX jumps over the lazy dOg", 0)).to eq("The quick brown FOX jumps over the lazy dOg")
    expect(caesar_cipher("The \"quick brown fox\" jumps over the lazy dog", 26)).to eq("The \"quick brown fox\" jumps over the lazy dog")
    expect(caesar_cipher("The quick brown fox jumps over the lazy dog", 1)).to eq("Uif rvjdl cspxo gpy kvnqt pwfs uif mbaz eph")
  end

  it "should refuse user input when the \"encryption_key\" argument is NOT a natural integer between 0 and 26" do
    expect(caesar_cipher("", -1)).to eq("Yo ! Je ne prends pour clé de chiffrement que les entiers naturels compris entre 0 et 26. TG")
    expect(caesar_cipher(" Toto Titi ", 1.23)).to eq("Yo ! Je ne prends pour clé de chiffrement que les entiers naturels compris entre 0 et 26. TG")
    expect(caesar_cipher("a", "chiffre")).to eq("Yo ! Je ne prends pour clé de chiffrement que les entiers naturels compris entre 0 et 26. TG")
  end

  it "should return nil when the \"phrase\" parameter is nil either is NOT a String" do
    expect(caesar_cipher(nil, 2)).to eq(nil)
    expect(caesar_cipher(20, 0)).to eq(nil)
    t = []
    expect(caesar_cipher(t, 0)).to eq(nil)
    h = {"Caesar" => "Morituri te saluant!"}
    expect(caesar_cipher(h, 0)).to eq(nil)
  end
end
