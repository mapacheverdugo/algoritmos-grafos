def ingresarGrafo
    puts "Ingrese el número de vertices: "
    vertices = gets.to_i

    if vertices > 26 then
        puts "Plz no"
    else
        seguir = true

        while true do
            
            vertices.times do |n|
                etiqueta = (97 + n).chr
                puts "Vertice " + etiqueta;
            end

            inicio = gets
            

        end
    end

    
end

class Arista
    def initialize(verticeI,verticeF,peso)
        @VerticeI=verticeI
        @VerticeF=verticeF
        @Peso=peso
    end
    attr_reader :VerticeI, :VerticeF, :Peso
end

ingresarGrafo