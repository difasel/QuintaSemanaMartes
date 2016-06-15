class Bicycle  
  attr_reader :gears, :wheels, :seats  
  def initialize(gears = 1)  
    @wheels = 3 
    @seats = 1  
    @gears = gears  
  end  
end  
  
class Tandem < Bicycle  
  def initialize(gears)  
    super  
    @seats = 2  
  end  
end  

p t = Tandem.new(3)  
puts t.gears  
puts t.wheels  
puts t.seats  

p "*"*50
p b = Bicycle.new
puts b.gears  
puts b.wheels  
puts b.seats 