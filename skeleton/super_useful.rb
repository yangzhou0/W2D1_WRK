# PHASE 2
require 'byebug'

def convert_to_int(str)

  Integer(str)
  rescue
    return nil


end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise CoffeeError.new("Thanks for the no_coffee, try again!") if maybe_fruit != 'coffee'
    puts "thanks for the coffee" if maybe_fruit == 'coffee'
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  end
end

class NameError < StandardError
end
class YearsError < StandardError
end
class PastimeError < StandardError
end

# PHASE 4
class BestFriend

    attr_reader :name, :yrs_known, :fav_pastime

    def initialize(name, yrs_known, fav_pastime)
        @name = name
        @yrs_known = yrs_known
        @fav_pastime = fav_pastime
        begin
          raise YearsError.new("You cannot know a bestie less than five years") if @yrs_known < 5
          raise PastimeError.new("You must know your best friend's pasttime") if @fav_pastime.length <= 1
          raise NameError.new("You must know your best friend's name") if @name.length <= 1
        rescue NameError, YearsError, PastimeError => e
          puts e.message
          @name = gets.chomp if e.class == NameError
          @yrs_known = gets.chomp.to_i if e.class == YearsError
          @fav_pastime = gets.chomp if e.class == PastimeError
        retry
      end
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

harry = BestFriend.new("",2,"")
puts harry.name
puts harry.yrs_known
puts harry.fav_pastime
