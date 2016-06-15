# Ivan y Mauricio
# Torteria
# Martes 14 de Junio 2016  
  # Torteria Ivan
  # 1.-Preparar diferentes tipos de tortas con diferentes productos (Pan, queso, pollo, carne, vegetales) 
  # 2.-Meter tortas al horno
  # 3.-Ver el estado de las tortas:   estados : crudo, casi l isto, listo y quemado
  # 4.-Sacar tortas cuando esten listas
  # 5.- Disfrutar!

class Torteria 

  def initialize
    @tortas = []
    @@number_of_tortas = 0 
  end

  def tipo
    rand()
  end

  def preparar(torta)
    @@number_of_tortas += 1
    puts "*" * 30 + "TORTERIA IVAN 'EL TERRIBLE'!!! " + "*" * 30 
    puts "1.- Se comienza a preparar la torta: "
    puts "\tSe le hunta al #{torta.tipo[0]}, los #{torta.tipo[1]} y la #{torta.tipo[2]}, "
    puts "\tdentro del pan se agregan los ingredientes: #{torta.tipo[3..7].join(", ")}"
    @tortas << torta
    hornear(torta)
    #puts @ingredientes
  end

  def self.number_of_tortas
    @@number_of_tortas
  end

  def hornear(torta)
    
    if @@number_of_tortas > 3
      puts "2.- El horno esta lleno, favor de esperar"
    else 
      tiempo = rand(10)
      puts "2.- Se mete a hornear la torta"
      if tiempo <= torta.buena-3
        puts "\tLas tortas estan crudas"
      elsif tiempo <= torta.buena-1
        puts "\tTu torta esta casi lista"
      elsif tiempo >= torta.buena  && tiempo < torta.quemada 
        puts "\tTu torta esta lista" 
        @@number_of_tortas -= 1
      elsif tiempo >= torta.quemada
        puts "\tTu torta se quemo"
        @@number_of_tortas -= 1
      else
        puts "\tEROR 404!!"
      end
    end

  end

end


class Torta
  attr_accessor :tipo ,:buena, :quemada

   def initialize(tipo, buena, quemada)
     @tipo =  ["pan", "frijoles", "mayonesa", "jitomate", "cebolla", "aguacate", "queso"]
     @tipo << tipo
     @buena = buena
     @quemada = quemada
    
   end

   def pasar_ingredientes
     @tipo
   end

end

torteria = Torteria.new
torta_jamon = Torta.new("jamon",5,8)
torta_milanesa = Torta.new("milanesa",4,8)
torta_pierna = Torta.new("pierna",7,9)
torta_huevo = Torta.new("huevo",3,6)
torta_pastor = Torta.new("pastor",5,6)
torteria.preparar(torta_jamon)
puts "3.- El numero de tortas en el horno es de: #{Torteria.number_of_tortas} tortas"
torteria.preparar(torta_milanesa)
puts "3.- El numero de tortas en el horno es de: #{Torteria.number_of_tortas} tortas"
torteria.preparar(torta_pierna)
puts "3.- El numero de tortas en el horno es de: #{Torteria.number_of_tortas} tortas"
torteria.preparar(torta_huevo)
puts "3.- El numero de tortas en el horno es de: #{Torteria.number_of_tortas} tortas"
torteria.preparar(torta_pastor)
puts "3.- El numero de tortas en el horno es de: #{Torteria.number_of_tortas} tortas"
puts 




