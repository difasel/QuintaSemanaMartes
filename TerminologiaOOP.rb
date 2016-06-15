# # Ivan y Mauricio
# # Terminología OOP
# # Martes 14 de Junio 2016  

#######################################################################################################
#######################################################################################################
#                                           Inheritamce 
#######################################################################################################
#######################################################################################################



#  Herencia se refier a asignar o heredar todos los comportamientos de una clase hacia otra clase, 
#    la clase que hereda la llamaremos superclase,mientras que la que recibe esa herencia 
#    o comportamientos la llamaremos subclase, lo cual evita escribir codigo inescesario
  


class Animal

  def dormir
    "ZZzzzz ZZzzzz"
  end

  def comer
    "mmmm"
  end

  def poop
    "El animal hace "
  end

  def act_animal
        "Su accion es "
    end

end

class Mammal < Animal

  def warm_blooded?
    "Los mamiferos tienen en promedio 35 grados centigrados"
  end

  def mammal_num
    "El numero de patas de este mamifero es: "
  end

end

class Dog < Mammal

    PERRO = "Ladrar" 
  PATAS_PERRO = "4"

  def poop
    super + "1/2 kg."
  end

  def act_animal
        super + PERRO
    end

  def mammal_num
    super + PATAS_PERRO
  end

end

class Fish < Animal

    PEZ = "Nadar"

  def swim
    "Nada todo el dia"
  end

  def poop
    super + "1 gr."
  end

    def act_animal
        super + PEZ
    end

end

perro1 = Dog.new
pez1 = Fish.new

#test
#Aquí deben ir las pruebas correspondientes

p perro1.comer == "mmmm"
p pez1.dormir == "ZZzzzz ZZzzzz"
p pez1.poop == "El animal hace 1 gr."
p perro1.poop == "El animal hace 1/2 kg."
p pez1.swim == "Nada todo el dia"
p pez1.act_animal == "Su accion es Nadar"
p perro1.act_animal == "Su accion es Ladrar"
p perro1.mammal_num == "El numero de patas de este mamifero es: 4"

=end



#######################################################################################################
#######################################################################################################
#                                         Composition
#######################################################################################################
#######################################################################################################

# Composition es muy similar a la herencia, sin embargo en este caso se crea un modulo con las funciones a 
#   compartir, por lo cual ese modulo puede ser mandado a llamar desde la clase para acceder a dichas funciones

module Animal

  def dormir
    "ZZzzzz ZZzzzz"
  end

  def comer
    "mmmm"
  end

  def poop
    "El animal hace "
  end

  def act_animal
        "Su accion es "
    end

end



class Fish 

  include Animal

    PEZ = "Nadar"

  def swim
    "Nada todo el dia"
  end

  def poop
    super + "1 gr."
  end

    def act_animal
        super + PEZ
    end

end


pez1 = Fish.new

#test
#Aquí deben ir las pruebas correspondientes


p pez1.dormir == "ZZzzzz ZZzzzz"
p pez1.poop == "El animal hace 1 gr."
p pez1.swim == "Nada todo el dia"
p pez1.act_animal == "Su accion es Nadar"

#######################################################################################################
#######################################################################################################
#                                          Encapsulation
#######################################################################################################
#######################################################################################################

# Se refiera al ocultar datos de un objeto, de manera que solo se puedan cambir mediante operaciones 
#   definidas  para ese objeto

class Encaousulacion
  # acá van los métodos públicos
  # Los métodos publicos puede ser accedidos desde cualquier parte de la aplicación 


  ## Los métodos privados y protegidos pueden ser accedidos desde la misma clase o desde alguna de sus subclases.
  protected
    # acá van los métodos protegidos

  private
    # acá van los métodos privados


end

#######################################################################################################
#######################################################################################################
#                                           Duck Typing
#######################################################################################################
#######################################################################################################

# Si un objeto hace quack como un pato (o actúa como un string), pues trátalo como un pato (o una cadena).
# Siempre hay que tratar a un objeto por lo que puede hacer 

# Comprobamos qué objetos responden al método t_str 
puts ('Una cadena'.respond_to? :to_str)   # => true  
puts (Exception.new.respond_to? :to_str)  # => true  
puts (4.respond_to? :to_str) # => false



#######################################################################################################
#######################################################################################################
#                                           The Law of Demeter (ej.)
#######################################################################################################
#######################################################################################################
# Los objetos tiene que tener la información y hacer las acciones que neceistan... ni más ni menos

class Wallet
  attr_accessor :cash
  def withdraw(amount)
     raise InsufficientFundsError if amount > cash
     cash -= amount
     amount
  end
end
class Customer
  has_one :wallet
  # behavior delegation
  def pay(amount)
    @wallet.withdraw(amount)
  end
end
class Paperboy
  def collect_money(customer, due_amount)
    @collected_amount += customer.pay(due_amount)
  end
end



#######################################################################################################
#######################################################################################################
#                                           Overriding Methods (and using super)
#######################################################################################################
#######################################################################################################
##

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
    super       ## super te trae los valores del padre
    @seats = 2  ## este es el overriding
  end  
end  
t = Tandem.new(3)  
puts t.gears  
puts t.wheels  
puts t.seats  

p "*"*50
b = Bicycle.new
puts b.gears  
puts b.wheels  
puts b.seats 


#######################################################################################################
#######################################################################################################
#                                           Modules
#######################################################################################################
#######################################################################################################
## los Modulos pueden actuar como librerias
## se puede aumentar las funcionalidades de las clases. 
## se puede usar mas de un modulo al mismo tiempo

module D  
  def initialize(nombre)  
    @nombre =nombre  
  end  
  def to_s  
    @nombre  
  end  
end  
 
module Debug  
  include D  ## aqui incluye el modulo de D
  # Los métodos que actúan como preguntas,
  # se les añade una ?
  def quien_soy?
    "#{self.class.name} (\##{self.object_id}): #{self.to_s}"
  end
end
 
class Gramola
  # la instrucción 'include' hace referencia a un módulo.
  # Si el módulo está en otro fichero, hay que usar 'require'
  # antes de usar el 'include'. 
  include Debug  
  # ...  
end  
 
class OchoPistas 
  include Debug  
  # ...  
end  
 
gr = Gramola.new("West End Blues")
op = Ochopistas.new("Real Pillow")
puts gr.quien_soy?
puts op.quien_soy?


#######################################################################################################
#######################################################################################################
#                                           Scope
#######################################################################################################
#######################################################################################################

## es el alcance del las variables y la visibilidad que tiene en un programa. 
## Class variable (@@a_variable): Available from the class definition and any sub-classes. Not available from anywhere outside.
## Instance variable (@a_variable): Available only within a specific object, across all methods in a class instance. Not available directly from class definitions.
## Global variable ($a_variable): Available everywhere within your Ruby script.
## Local variable (a_variable): It depends on the scope. You’ll be working with these most and thus encounter the most problems, because their scope depends on various things.
## http://natashatherobot.com/wp-content/uploads/variable-scope-ruby.jpg


#######################################################################################################
#######################################################################################################
#                                           Private vs Public Methods
#######################################################################################################
#######################################################################################################


# La diferncia entre un metodo publico y un privado, es que del privado no se puede accesar desde 
#   fuera de la clase, a diferencia del metodo publico.

class Encaousulacion
  # acá van los métodos públicos
  # Los métodos publicos puede ser accedidos desde cualquier parte de la aplicación 


  ## Los métodos privados y protegidos pueden ser accedidos desde la misma clase o desde alguna de sus subclases.
  protected
    # acá van los métodos protegidos

  private
    # acá van los métodos privados

#***  Instance vs Class methods and variables
## Una instancia es la froma en que mandamos a llamar a la clase, es decir una clase puede tener 
##   muchas instancias
  

class Person

  attr_reader :name, :age

  def initialize(name, edad)
    @name = name
    @edad = edad
  end

  def age
    "#{@name} is #{years_old} years old."
  end

  private

    def years_old
      current_year = Time.new.year
      current_year - @edad
    end

end


carlos = Person.new("Carlos",1986)
martha = Person.new("Martha",1990)
#test
p carlos.age == "Carlos is 30 years old."
#=>true#
p martha.age == "Martha is 26 years old."
#=>true

p carlos.years_old
#=>private method `years_old'...(NoMethodError)


#***  Polymorphism

# Se refiere a la capacidad de un objeto para tomar otras formas

def draw_figure(figure, x, y)
  set_coordinates(x, y)
  figure.draw
end

class Circle
  attr_accessor :radius

  def draw
    ...
  end
end

class Triangle
  attr_accessor :base, :height

  def draw
    ...
  end
end


#######################################################################################################
#######################################################################################################
#                                           Separation of Concerns
#######################################################################################################
#######################################################################################################

# Es unprincipio de diseño para separar un programa informatico en secciones distintas, tal que cada 
#   seccion se enfoca en un interes delimitado


#bear_hunting.rb
class Bear
  def hunt
    # TODO: return some food
  end
end
#bear_eating.rb
 class Bear
   def eat( food )
     raise "#{food} is not edible!" unless food.respond_to? :nutrition_value
     food.nutrition_value
   end
 end
#bear_hunger.rb
class Bear
  attr_accessor :hunger
  def monitor_hunger
    if @hunger > 50 then
      @hunger -= self.eat( self.hunt )
    end
  end
end






























































