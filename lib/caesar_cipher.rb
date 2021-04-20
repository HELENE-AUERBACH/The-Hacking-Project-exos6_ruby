def letter_caesar_cipher(letter, encryption_key)
  result = nil
  if !encryption_key.nil? && encryption_key.instance_of?(Integer) && (0..26).cover?(encryption_key) && !letter.nil? && letter.length == 1 
    result = letter
    if (1..25).cover?(encryption_key) && letter.instance_of?(String) && (('A'..'Z').cover?(letter) || ('a'..'z').cover?(letter))
      if ('A'..'Z').cover?(letter)
        result = ('A'.ord + ((letter.ord - 'A'.ord + encryption_key) % 26)).chr
      else
        result = ('a'.ord + ((letter.ord - 'a'.ord + encryption_key) % 26)).chr
      end
    end
  end
  result
end

def caesar_cipher(phrase, encryption_key)
  if encryption_key.nil? || !encryption_key.instance_of?(Integer) || !(0..26).cover?(encryption_key)
    return "Yo ! Je ne prends pour clé de chiffrement que les entiers naturels compris entre 0 et 26. TG"
  end

  result = nil
  if !phrase.nil? && phrase.instance_of?(String)
    result = phrase
    if (1..25).cover?(encryption_key) && phrase.length > 0
        result = (phrase.chars.map { |letter| letter_caesar_cipher(letter, encryption_key) }).join("")
    end
  end
  result
end
