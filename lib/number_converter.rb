class NumberConverter

    def initialize
        
        get_dictionary
        get_keypad
        get_input
        
    end

    # Read the dictionary file and store contents in a global array
    def get_dictionary
        @words = File.read("dictionary.txt").split("\n").map(&:downcase)
    end

    # Read user input and generate combination
    def get_input
        puts "Please enter a 10 digit number (It should not contain 0 or 1):"
        number = gets.chomp
        get_key_combinations(number)
    end

    # Hash to store numbers representing alphabets as on a phone keypad.
    def get_keypad
        @keypad = {
            "2" => ['a','b','c'],
            "3" => ['d','e','f'],
            "4" => ['g','h','i'],
            "5" => ['j','k','l'],
            "6" => ['m','n','o'],
            "7" => ['p','q','r','s'],
            "8" => ['t','u','v'],
            "9" => ['w','x','y','z']
        }
    end

    #It validates if the number is of 10 digits and does not contain 0 or 1.
    def check_valid_number(number)
        unless (number.length == 10 && number.match(/^[2-9]*$/))
            raise "The given number is not valid. Please try again"
        end
    end

    # Method to create all possible word combinations using the letters.
    def get_key_combinations(number)
        time_start = Time.now()
        check_valid_number(number)
        number_array = number.split("")

        # Converts numbers array into an array of characters maching each of the number from keypad list.
        key_characters = number_array.map{|n| @keypad[n]}

        # Find Product of each key's characters with all other key's characters respectively.
        begin
            key_words = key_characters.shift.product(*key_characters).map(&:join)
        rescue TypeError
            return "The number you have entered is not a valid number. Please try again."
        end

        search_word_combinations(key_words)
        time_end = Time.now()
        puts "Time #{time_end.to_f - time_start.to_f}"
    end

    # Method to search all possible combinations against dictionary.
    def search_word_combinations(key_words)
        final_words = []
        # Loop to get all combinations of words (Minimum word length 3)
        i = 2
        while i < 7 do
            a = key_words.map{|x| x[0..i]}.uniq
            b = key_words.map{|y| y[i+1..-1]}.uniq

            # Find all matching words from dictionary
            words_one = @words & a
            words_two = @words & b

            # Combining the result arrays
            merge_words = words_one.product(words_two)
            final_words << merge_words unless merge_words.empty?

            i += 1
        end

        exact_matches = @words & key_words
        final_words << exact_matches

        p final_words.flatten(1)
    end
end

NumberConverter.new
