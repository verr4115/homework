#Part 1
#(a) Write a method that will see if a word is a palindrome.

def palindrome?(string)
    string = string.downcase.scan(/\w/)
   if string == string.reverse
       puts "Yay! This is a palindrome"
       return true
   else
       puts "This is not a palindrome"
   end
end

#Now we call the method on some tests:
palindrome?("racecar")
palindrome?("ThisIsNotAPalindrome")
palindrome?("123321")
palindrome?("This is not")
palindrome?("This should be eb dluohs siht")
puts



#(b) string of input, return a hash whose keys are words in the string and whose values are 
#the number of times each word appears. NO FOR LOOPS

def count_words(string)
  string_array = string.gsub(/[^\w\s']/ , "").downcase.split
  counts = Hash.new(0)
  string_array.each do |word|
        counts[word] += 1
  end
    puts counts
end

count_words("Hi, how are you")
count_words("Hi how are you")
count_words("A cat walked around a park")
count_words("An impossible-dash")
puts





#Part 2
#(a). Rock Paper Scissors
class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end 

def compare_game?(game)
  return (game[0][1] + game[1][1]) =~ /rs|sp|pr|rr|ss|pp/i
end
 
def rps_game_winner(game)
  strategy=["r","p","s"]
  raise WrongNumberOfPlayersError unless game.length == 2
  if strategy.include?(game[0][1].downcase) && strategy.include?(game[1][1].downcase)
    if compare_game?(game)
      game[0]
    else
      game[1]
    end
  else
    raise NoSuchStrategyError
  end
end


#(b) Tournament
def rps_tournament_winner(game)
  if game[0][1].class==String
    rps_game_winner(game)
  else  # 迭代
    a1=rps_tournament_winner(game[0])
    a2=rps_tournament_winner(game[1])
    rps_tournament_winner([a1,a2])
  end
end

#Some tests:
p rps_game_winner([ [ "Armando", "P" ], [ "Dave", "S" ] ]  )
p rps_game_winner([ [ "Richard", "R" ], [ "Michael", "S" ] ]  )
p rps_game_winner([ [ "David E.", "R" ], [ "Richard X.", "P" ] ]  )
puts
puts "First tournament winner:"
p rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]],
                  [["Richard", "R"], ["Michael", "S"]]], 
                  [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], 
                   ["Richard X.", "P"]]]])
puts "Second tournament winner:"
p rps_tournament_winner([[[["Austin", "P"], ["Jeremy", "P"]],
                  [["James", "R"], ["Nick", "S"]]], 
                  [[["Jeff", "R"], ["RJ", "P"]], [["Jen", "S"], 
                   ["Deana", "P"]]]])


puts
puts



#Part 3
def combine_anagrams(words)
	hash = {}
	words.each do |word|
		string_to_compare = word.downcase.chars.sort.join
		if hash[string_to_compare]
			hash[string_to_compare].push(word)
		else
			hash[string_to_compare] = [word]
		end
	end
	combined_anagram = []
	hash.each do |key, value|
		combined_anagram.push(value)
	end
	return combined_anagram
end

#The Test:
puts "Here is the test:"
input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
output = combine_anagrams(input)
puts output.inspect




#Part 4
#(a) Dessert
class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    calories < 200
  end

  def delicious?
    true
  end
end


#(b)JellyBean
class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = "#{flavor} jelly bean"
  end

  def delicious?
    flavor != 'licorice'
  end
end











