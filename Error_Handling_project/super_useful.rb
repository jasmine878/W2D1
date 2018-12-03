require_relative "coffee_error"
require_relative "non_fruit_error"
require_relative "minimum_years_friend_error"
require_relative "no_favorite_pastime_error"
require_relative "no_name_error"

# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError # rescues any argument errors
  puts "Wrong input type.  We need an integer."
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
    # only raises CoffeeError if coffee.
    # coffeeError floating around.
    # moves to next line.
    # we need an else statement.  
    #default would be to returns nil and exits if not coffee
  else
    raise NonFruitError
  end 
  
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
rescue CoffeeError => error
  # comes from raise Coffee error above
  #stores CoffeeError within the error variable.  Call it anything.  Even "e"
  puts error.message
  #go to message within error message.  but we stored Coffee Error there
  #so go to coffee_error instance.
  retry
rescue NonFruitError => error
  puts error.message
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise NoNameError if name.length <= 0
    @name = name
    raise MinimumYearsFriendError if yrs_known < 5
    @yrs_known = yrs_known
    raise NoFavoritePasttimeError if fav_pastime.length <= 0
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


