require "pry"

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]





def substrings (string, dictionary)
    hash = {}
    string_array = string.downcase.split('')
    cut_string = []

    string_array.each do |i|
        cut_string.push(i)
        if dictionary.include?(i)
            if hash.has_key?(i)
                hash[i] += 1
            else
                hash[i] = 1
            end 
        elsif cut_string.last == ' ' || cut_string.last == '!' || cut_string.last == '?' || cut_string.last == ',' || cut_string.last == '.'
            cut_string.pop
            until cut_string.length == 0
                cut_string.shift
                if dictionary.include?(cut_string.join)
                    if hash.has_key?(cut_string.join)
                        hash[cut_string.join] += 1
                    else
                        hash[cut_string.join] = 1
                    end
                end
            end

        elsif dictionary.include?(cut_string.join)
            if hash.has_key?(cut_string.join)
                hash[cut_string.join] += 1
            else
                hash[cut_string.join] = 1
            end
        end             
    end
    
    return hash
end



puts substrings("Howdy partner, sit down! How's it going?", dictionary) #{ "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1}
