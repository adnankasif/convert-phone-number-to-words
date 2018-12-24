ENV["NUMBER_CONVERTER_ENV"] = "test"
require "number_converter"

describe NumberConverter do
  describe "Number to convert into words: 6686787825" do
    it "Should get all key combinations against dictionary and get matching words." do
      expect(NumberConverter.new.get_key_combinations("6686787825"))
                          .to eq([["noun", "struck"], 
                                  ["onto", "struck"], 
                                  ["motor", "truck"], 
                                  ["motor", "usual"], 
                                  ["nouns", "truck"], 
                                  ["nouns", "usual"], 
                                  "motortruck"])
    end
  end

  describe "Number to convert into words: 2282668687" do
    it "Should get all key combinations against dictionary and get matching words." do
      expect(NumberConverter.new.get_key_combinations("2282668687"))
                          .to eq([["act", "amounts"], 
                                  ["act", "contour"], 
                                  ["bat", "amounts"], 
                                  ["bat", "contour"], 
                                  ["cat", "amounts"], 
                                  ["cat", "contour"], 
                                  ["acta", "mounts"], 
                                  "catamounts"])
    end
  end
end