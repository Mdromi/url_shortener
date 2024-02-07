class ShortCode
    ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
    BASE = ALPHABET.length
  
    def self.encode(number)
      return ALPHABET.first if number.nil? || number.zero? 
      result = ""
  
      while number > 0 do 
        index = number % BASE
        char = ALPHABET[index] 
        result.prepend(char)
        number = number / BASE
      end
  
      result
    end
  
    def self.decode(string)
        return nil if string.nil? || string.empty?
        result = 0
    
        string.each_char do |char|
          index = ALPHABET.index(char)
          return nil if index.nil? # Invalid character
          result = result * BASE + index
        end
    
        result
    end
  end
  

# ShortCode.encode(1024)
# ShortCode.decode("gw")