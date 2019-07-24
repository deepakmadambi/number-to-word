class Dictionary
  # Class For Creating Dictionary
  attr_reader :letter_num_hash

  # hash of numbers along with respective letters
  NUM_LETTER_HASH = {
      "2"=>['a','b','c'],
      "3"=>['d', 'e', 'f'],
      "4"=>['g', 'h', 'i'],
      "5"=>['j', 'k', 'l'],
      "6"=>['m', 'n', 'o'],
      "7"=>['p', 'q', 'r', 's'],
      "8"=>['t', 'u', 'v'],
      "9"=>['w', 'x', 'y', 'z']
    }
  # @letter_num_hash will have hash of letter as key and its respective number as values from NUM_LETTER_HASH
  def initialize
    @letter_num_hash = NUM_LETTER_HASH.inject({}) do |temp_hash, (k, v)|
      v.each {|l| temp_hash[l] = k }
      temp_hash
    end
  end

  # File path
  FILE_DIR = File.dirname(__dir__)
  FILE_PATH = File.join(FILE_DIR,"dictionary.txt")

  # ALLOWED_LENGTHS is combinations of words lenth that can be generated ex: 334, 55, 73
  ALLOWED_LENGTHS = [3,4,5,6,7,10]

  #Returns dictionary hash of number as keys and respective word as values.
  #Get all number and its word its respective word
  def get_dictionary
    dictionary = {}
    File.foreach(FILE_PATH) do |word| # loop throughout file
      word = word.chop.to_s.downcase  # get only word (chop out enter)
      word_length = word.length
      if ALLOWED_LENGTHS.include?(word_length) # check whether word length is in ALLOWED_LENGTHS
        number_keys = ""
        (0...word_length).each do |i|
          number_keys += @letter_num_hash[word[i]] # append numbers based on each letter
        end
        word_value = dictionary.fetch(number_keys, []) # fetch word value else initialize new array
        word_value << word
        dictionary[number_keys] = word_value # assign word to respective numbers key
      end
    end
    return dictionary #return final dictionary
  end

end
