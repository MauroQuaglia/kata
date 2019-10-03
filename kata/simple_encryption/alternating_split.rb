class AlternatingSplit

  def encrypt(text, n)
    return text if (text.nil? || n <= 0)
    encrypt((text.chars.select.with_index {|_, index| index.odd?} + text.chars.select.with_index {|_, index| index.even?}).join(''), n - 1)
  end

  def decrypt(encrypted_text, n)
    return encrypted_text if (encrypted_text.nil? || n <= 0)
    result = ''
    array = encrypted_text.chars
    array.size.times do |index|
      result += index.odd? ? array[index / 2] : array[(index + array.size) / 2]
    end
    decrypt(result, n - 1)
  end

end