require_relative 'dictionary'
class PhoneNumber
  # Class For Getting All possible words for number
  attr_reader :number, :dictionary

  def initialize(number)
    @number = number # Valid 10 digit number from user
    @@dictionary = Dictionary.new().get_dictionary # dictionary hash of number as keys and respective word as values.
  end

  # Instance method to get final possible words.
  def get_final_result
    result = self.class.get_combination_array(@number)
    final_result = []
    result.each do |arr| # filter out all word combinations whose combined length is less than 10
      if arr.class == Array # checking for array
        final_result << arr if arr.join('').length == 10
      elsif arr.class == String # checking for string
        final_result << arr if arr.length == 10
      end
    end
    final_result
  end

  # Recursive method wich will give all combinations of words.
  def self.get_combination_array(phone_number)
    if phone_number.length <= 5 &&  phone_number.length >= 3# Minimum length of the word should be 3. if number_word  having 5 or less than that will generate word of length 2 or 1.
      return @@dictionary[phone_number] || []
    end

    results = []
    (3..phone_number.length).each do |initial_length|  # loop is starting from minimum word length to number length
      first_num_word = phone_number[0, initial_length] # truncating initial length number(word)
      rest_num_word = phone_number[initial_length, phone_number.length] # getting remaining number(word)
      words = @@dictionary[first_num_word] #Find words in this first_word key
      next unless words # next if there is no word
      remaining_words = self.get_combination_array(rest_num_word) # Get all words respectively
      words.each do |word|
        if remaining_words.any? # if remaining_word present then add them with word and push to result
          remaining_words.each do |remaining_word|
            final_array = [word, remaining_word].flatten
            results << final_array
          end
        else
          results << word # push word to result
        end
      end
    end
    results
  end

end
