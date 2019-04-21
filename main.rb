class Arista
    def initialize(verticeI,verticeF,peso)
        @VerticeI=verticeI
        @VerticeF=verticeF
        @Peso=peso
    end
    attr_reader :VerticeI, :VerticeF, :Peso
end

def ingresarGrafo
    puts "Ingrese el número de vertices: "
    vertices = gets.to_i

    if vertices > 26 then
        puts "Plz no"
    else
        seguir = true
        aristas = []

        while seguir do
            
            vertices.times do |n|
                etiqueta = (97 + n).chr
                puts "(#{n + 1}) Vertice " + etiqueta;
            end
            puts "(0) Dejar de ingresar aristas"

            puts "Ingrese el vertice de inicio"
            inicio = gets.to_i

            if inicio == 0 then
                seguir = false
            else 
                puts "Ingrese el vertice de termino"
                fin = gets.to_i

                puts "Ingrese el peso de la arista"
                peso = gets.to_i
                arista = Arista.new(inicio, fin, peso)
                aristas.push(arista)
            end
        end

        for arista in aristas
            puts "----"
            puts "Inicio: #{arista.VerticeI}"
            puts "Fin: #{arista.VerticeF}"
            puts "Peso: #{arista.Peso}"
            puts "----"
        end
    end

    
end

ingresarGrafo