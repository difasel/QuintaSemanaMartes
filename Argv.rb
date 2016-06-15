# Ivan y Mauricio
# ARGV
# Martes 14 de Junio 2016


def pig_latin_words
 
    array_oracion = []
    array_palabra = []
    array_final = []
    array_oracion = ARGV
    string_palabra = ""
     
    array_oracion
    array_oracion.each do |palabra_oracion|
        array_palabra = palabra_oracion.split('')
       
        if array_palabra.first.scan(/[aeiou]/).count > 0
            array_palabra.each { |letra| string_palabra << letra } 
            array_final << string_palabra + "way"
            string_palabra = ""
        elsif array_palabra.first.scan(/[AEIOU]/).count > 0
            array_palabra.each { |letra| string_palabra << letra } 
            array_final << string_palabra + "way"
            string_palabra = ""
        elsif array_palabra.first.scan(/[qwrtypsdfghjklñzxcvbnm]/).count > 0
            until array_palabra.first.scan(/[qwrtypsdfghjklñzxcvbnm]/).count == 0
                array_palabra.insert(array_palabra.count-1,array_palabra.delete_at(0))
            end
            array_final << array_palabra.join + "ay"
        elsif array_palabra.first.scan(/[QWRTYPSDFGHJKLÑZXCVBNM]/).count > 0
            until array_palabra.first.scan(/[QWRTYPSDFGHJKLÑZXCVBNM]/).count == 0
                array_palabra.insert(array_palabra.count-1,array_palabra.delete_at(0))
            end
            array_final << array_palabra.join + "ay"
        else
            "error"
        end
    end
 
p array_final.join(" ")
 
end
 
pig_latin_words


