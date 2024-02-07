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
      # Implement decoding logic here
    end
  end
  

# ShortCode.encode(1024)
# ShortCode.decode("gw")