require_relative "Arista"
require 'matrix'

#variable global (Contiene cantidad de vertices)
$vertices
#Variable global (Lista de aristas)
$aristas=[]

def textoMenu
    #Esta función sólo mostrará las opciones del menú principal
    puts "Menú principal"
    puts "1) Configurar grafo"
    puts "2) Mostrar matriz de adyacencia"
    puts "3) Verificar si un grafo es conexo"
    puts "4) Cantidad de caminos entre vértices"
    puts "5) Dijkstra"
    puts "0) Salir\n\n"
end

def limpiar
    if Gem.win_platform?
      system 'cls'
    else
      system 'clear'
    end
end

def ingresarGrafo
    puts "Ingrese el número de vertices: "
    $vertices = gets.to_i

    if $vertices > 26 then
        puts "Plz no"
    else
        seguir = true
        

        while seguir do
            
            $vertices.times do |n|
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
                $aristas.push(arista)
            end
        end

        for arista in $aristas
            puts "----"
            puts "Inicio: #{arista.VerticeI}"
            puts "Fin: #{arista.VerticeF}"
            puts "Peso: #{arista.Peso}"
            puts "----"
        end
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
                
                ingresarGrafo
            when 2

                matriz($vertices)
                puts"Matriz de Adyacencia\n\n"
                p $Matriz
                p $Matriz**2
                puts"\n"
                #Aquí va la función de la matriz de adyacencia
            when 3
                puts "Esta es la opción 3\n\n"
                #Aquí va la función del grafo conexo
            when 4
                puts "Esta es la opción 4\n\n"
                #Aquí va la función de cantidad de caminos
            when 5
                puts "Esta es la opción 5\n\n"
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

###
# Aquí finaliza la presentación y el menú
###



######################
# Matriz de Adyasencia
######################

#Valor Global que contiene la Matriz de adyacencia
$Matriz
$ArrayM=[]

#Crea una lista con las aristas igual al numero comparado
def EncVertice(comparar)
    numeros=[]
    cont=0
    while(cont<$aristas.length())
        vertice=$aristas[cont]
        if(comparar==vertice.VerticeI)
            numeros.push(vertice.VerticeF)
        elsif(comparar==vertice.VerticeF)
            numeros.push(vertice.VerticeI)
        end
        cont=cont+1
    end
    numeros.sort()
    return numeros
end

#Crea la matriz al comparar los datos obtenidos de la lista creada por la funcion anterior
def matriz (numero)
    $ArrayM=[]
    for i in (0..numero-1)
        $Fila=[]
        $Comp=EncVertice(i+1)
        cont=0
        for j in (0..numero-1)
            if(j+1==$Comp[cont])
                $Fila.push(1)
                cont=cont+1
            else
                $Fila.push(0)
            end
        end
        $ArrayM.push($Fila)
    end    
    $Matriz= Matrix[*$ArrayM]                  
end


###############################

main

