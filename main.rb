require_relative "Arista"
require_relative "Grafo"
require_relative "Vertice"

require 'matrix'
require 'io/console'

class Matrix
    def []=(i, j, x)
      @rows[i][j] = x
    end

    def pretty_print
        arr = @rows
        width = arr.flatten.max.to_s.size + 2
        puts arr.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
    end
end

#Variable global (Contiene los numeroVertices y aristas)
$grafo

def textoMenu
    #Esta función sólo mostrará las opciones del menú principal
    puts "Menú principal"
    puts "(1) Configurar grafo"
    puts "(2) Mostrar matriz de adyacencia"
    puts "(3) ¿El grafo es conexo?"
    puts "(4) Matriz de caminos de largo n"
    puts "(5) Camino mínimo con Dijkstra"
    puts "(0) Salir\n\n"
end

def limpiar
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
end

def ingresarGrafo
    aristas = []
    vertices = []
    esDirigido = true

    puts "(1) Grafo dirigido"
    puts "(2) Grafo no dirigido"
    print "\nIngrese el tipo de grafo: "
    valorDirigido = gets.to_i

    if (valorDirigido == 2)
        esDirigido = false
    end

    print "\nIngrese el número de vertices: "
    numeroVertices = gets.to_i

    seguir = true

    numeroVertices.times do |n|
        if (65 + n <= 90)
            etiqueta = (65 + n).chr
        else
            etiqueta = ""
            ((65 + n) / 26).times do |n|
                etiqueta +=  ((65 + n) / 26).chr
            end
        end
        
        vertices.push(Vertice.new(n + 1, etiqueta))
    end
        
    while seguir do
        print "\n"
        for vertice in vertices
            puts "(#{vertice.valor}) Vertice " + vertice.etiqueta
        end

        puts "(0) Dejar de ingresar aristas"

        print "\nIngrese el vertice de inicio: "
        inicio = gets.to_i
        
        if inicio == 0 then
            seguir = false
        else 
            print "\nIngrese el vertice de termino: "
            fin = gets.to_i

            print "\nIngrese el peso de la arista: "
            peso = gets.to_i
            arista = Arista.new(vertices[inicio - 1], vertices[fin - 1], peso)
            aristas.push(arista)
        end
    end

    $grafo = Grafo.new(vertices, aristas, esDirigido)
end

def menu
    salir = false
    opcion = nil

    while salir != true do
        #limpiar #Esta función sirve para "limpiar" la consola
        limpiar
        textoMenu
        opcion = gets

        limpiar

        case opcion.to_i
            when 1
                puts "INGRESANDO UN GRAFO"
                puts ""
                ingresarGrafo
            when 2
                puts "MATRIZ DE ADYACENCIA"
                puts ""
                $grafo.matrizAdyacencia.pretty_print
                print "\nPresiona cualquiera tecla para continuar..."                                                                                                    
                STDIN.getch 
            when 3
                puts "¿EL GRAFO ES CONEXO?"
                puts ""
                if ($grafo.conexo?)
                    puts "El grafo es conexo"
                else
                    puts "El grafo no es conexo"
                end
                print "\nPresiona cualquiera tecla para continuar..."                                                                                                    
                STDIN.getch 
            when 4
                puts "MATRIZ DE CAMINOS DE LARGO N"
                puts ""
                print "\nDefina el largo de los caminos: "
                largo = gets.to_i
                $grafo.matrizCaminos(largo).pretty_print
                print "\nPresiona cualquiera tecla para continuar..."                                                                                                    
                STDIN.getch 
            when 5
                puts "CAMINO MÍNIMO CON DIJKSTRA"
                puts ""

                for vertice in $grafo.vertices
                    puts "(#{vertice.valor}) Vertice " + vertice.etiqueta
                end
                print "\nEscoja un vertice de origen: "
                vertice = gets.to_i
                $grafo.caminosMinimos(Vertice.new(vertice, (64 + vertice).chr))

                print "\nPresiona cualquiera tecla para continuar..."                                                                                                    
                STDIN.getch 
            when 0
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

