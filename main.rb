class Arista
    def initialize(verticeI,verticeF,peso)
        @VerticeI=verticeI
        @VerticeF=verticeF
        @Peso=peso
    end
    attr_reader :VerticeI, :VerticeF, :Peso
end

def textoMenu
    #Esta función sólo mostrará las opciones del menú principal
    puts "Menú principal"
    puts "1) Mostrar matriz de adyacencia"
    puts "2) Verificar si un grafo es conexo"
    puts "3) Cantidad de caminos entre vértices"
    puts "4) Dijkstra"
    puts "0) Salir\n\n"
end

def limpiar
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
end

def menu
    salir = false
    opcion = nil

    while salir!=true do
        #limpiar #Esta función sirve para "limpiar" la consola
        textoMenu
        opcion = gets

        case opcion.to_i
            when 1
                puts "Esta es la opción 1\n\n"
                #Aquí va la función de la matriz de adyacencia
            when 2
                puts "Esta es la opción 2\n\n"
                #Aquí va la función del grafo conexo
            when 3
                puts "Esta es la opción 3\n\n"
                #Aquí va la función de cantidad de caminos
            when 4
                puts "Esta es la opción 4\n\n"
                #Aquí va la función del Dijkstra
            when 0
                puts "El programa finalizará"
                salir = true
            else
                puts "La opción no es válida\n\n"
        end
    end
end

def main
    puts "Grafos y lenguajes formales\n21041|INFB8061-1\n\nTrabajo 1: Matrices de Adyacencia\n"
    puts "Integrantes:\n"
    puts "- Felipe Flores Vivanco\n- Andrés Mella\n- Jorge Verdugo Chacón\n- Javiera Vergara Navarro\n\n"
    menu
end
main
###
# Aquí finaliza la presentación y el menú
###

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
