class NumberConverter

    def initialize
        get_dictionary
        get_keypad
        get_input
    end

    def get_dictionary
        @dictionary_words = File.read("dictionary.txt").split("\n").map(&:downcase)
    end

    def get_input
        puts "Please enter a 10 digit number (It should not contain 0 or 1):"
        number = gets.chomp
        unless (number.length == 10 && number.match(/^[2-9]*$/))
            raise "The given number is not valid. Please try again"
        end
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
   
end

NumberConverter.new