
#
# This will make the #roll method available on the Roller class.
# 
# @example
# 
#     Roller.roll(20) # => 1
# 
class Roller
  
  def self.roll(number)
    result = rand(number) + 1
  end
  
end


#
# This does the same thing as above, but it saves you from having to put the self
# in front of all your methods. This is useful if you have other methods you 
# want to make available:
# 
# @example
# 
#     Roller2.roll(12) # => 11
#     Roller2.d100 # => 99
#     Roller2.d20 # => 20
# 
class Roller2
  class << self

    def roll(number)
      result = rand(number) + 1
    end
    
    def d100
      rand(100) + 1
    end
    
    def d20
      rand(20) + 1
    end
    
  end
end


#
# Another way is using a Module
# 
# @example
# 
#     Roller3.roll(10) # => 8
#     Roller3.d30 # => 23
# 
module Roller3
  extend self
  
  def roll(number)
    rand(number) + 1
  end
  
  def d30
    rand(30) + 1
  end
end
