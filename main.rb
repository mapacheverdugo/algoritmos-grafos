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