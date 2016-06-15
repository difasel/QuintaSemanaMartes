# Ivan y Mauricio
# Herencia
# Martes 14 de Junio 2016

class Vehicle
  attr_accessor :number_of_wheels, :color ,:age
   
   def age!
     @age = rand(10)
   end

  def what_am_i?
    # Este método va a ser utilizado por varias clases y deberá regresar 
    # el nombre de la clase desde la cual se corrió.
    # ej.
    # bocho = Car.new
    # bocho.what_am_i? => Car
  self.class
  end

end


class Motorized < Vehicle
  attr_accessor :has_motor, :tank_size , :refuel ,:number_of_gears 
 
end

class Motorbike < Motorized

end

class Car < Motorized
end

class Bicycle < Vehicle  
  attr_accessor :number_of_gears 
 

  def initialize (number_of_gears)
    @number_of_gears = number_of_gears  
  end

end

class Skateboard < Vehicle
end

moto = Motorbike.new
car = Car.new
bike = Bicycle.new(8)
skateboard = Skateboard.new

vehicles = [moto, car, bike, skateboard]


vehicles.each do |vehicle|
  vehicle.age!
  puts "#{vehicle.what_am_i?} responds to:"
  puts "\tNumber of wheels: #{vehicle.respond_to?(:number_of_wheels) == true}"
  puts "\tColor: #{vehicle.respond_to?(:color) == true}"
  puts "\tAge!: #{vehicle.respond_to?(:age!) == true}"
  puts "\tHas motor: #{vehicle.respond_to?(:has_motor) == true}"
  puts "\tTank size: #{vehicle.respond_to?(:tank_size) == true}"
  puts "\tRefuel: #{vehicle.respond_to?(:refuel) == true}"
  puts "\tNumber of gears: #{vehicle.respond_to?(:number_of_gears) == true}"
  puts "\tAge: #{vehicle.age}"
  puts "\n\n"
end



