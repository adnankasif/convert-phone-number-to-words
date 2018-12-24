class NumberConverter

    def initialize
        get_dictionary
        get_keypad
        get_input
    end

    def get_dictionary
        @words = File.read("dictionary.txt").split("\n").map(&:downcase)
    end

    def get_input
        puts "Please enter a 10 digit number (It should not contain 0 or 1):"
        number = gets.chomp
        get_key_combinations(number)
    end

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


    def check_valid_number(number)
        unless (number.length == 10 && number.match(/^[2-9]*$/))
            raise "The given number is not valid. Please try again"
        end
    end

    def get_key_combinations(number)
        check_valid_number(number)
        number_array = number.split("")

        key_characters = number_array.map{|n| @keypad[n]}

        begin
            key_words = key_characters.shift.product(*key_characters).map(&:join)
        rescue TypeError
            return "The number you have entered is not a valid number. Please try again."
        end

        search_word_combinations(key_words)
    end

    def search_word_combinations(key_words)
        final_words = []
        i = 2
        while i < 7 do
            a = key_words.map{|x| x[0..i]}.uniq
            b = key_words.map{|y| y[i+1..-1]}.uniq

            words_one = @words & a
            words_two = @words & b

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
