require_relative 'libs/priority_queue'

class Grafo
    def initialize(vertices, aristas, esDirigido)
        @esDirigido = esDirigido
        @vertices = vertices
        @aristas = aristas
    end
    attr_reader :vertices, :aristas, :esDirigido

    def matrizAdyacencia
        matriz = Matrix.zero(@vertices.length)
        i = 0
        for vertice in @vertices
            adyacentes = verticesAdyacentes(vertice)
            for adyacente in adyacentes
                matriz[i, adyacente - 1] += 1
            end
            i += 1
        end

        return matriz
    end

    def matrizPeso
        matriz = Matrix.build(@vertices.length, @vertices.length) { Float::INFINITY }
        i = 0
        for vertice in @vertices
            incidentes = aristasIncidentes(vertice)
            for aristaIncidente in incidentes
                matriz[i, aristaIncidente.verticeFin.valor - 1] = aristaIncidente.peso
            end
            i += 1
        end

        return matriz
    end

    def verticesAdyacentes(vertice)
        verticesAdyacentes = []
        for arista in @aristas
            if (vertice.valor == arista.verticeInicio.valor)
                verticesAdyacentes.push(arista.verticeFin.valor)
            elsif (!@esDirigido && vertice.valor == arista.verticeFin.valor)
                verticesAdyacentes.push(arista.verticeInicio.valor)
            end
        end

        verticesAdyacentes.sort()
        return verticesAdyacentes
    end

    def aristasIncidentes(vertice)
        aristasIncidentes = []
        for arista in @aristas
            if (vertice == arista.verticeInicio)
                aristasIncidentes.push(arista)
            end
        end

        return aristasIncidentes
    end

    def aristaEntre(origen, destino)
        for arista in @aristas
            if (origen == arista.verticeInicio.valor && destino == arista.verticeFin.valor)
                return arista
            elsif (!@esDirigido && destino == arista.verticeInicio.valor && origen == arista.verticeFin.valor)
                return arista
            end
        end
        return nil
    end

    def caminosMinimos(origen)
        antecesores = dijkstra(origen)
        p antecesores
        pesos = antecesores[1]
        antecesores = antecesores[0]
        for vertice in @vertices
            if (vertice.valor != origen.valor)
                if (pesos[vertice.valor] == Float::INFINITY)
                    puts "\nNo existe camino desde #{origen.etiqueta} hasta #{vertice.etiqueta}"
                else
                    puts "\nEl camino mínimo desde #{origen.etiqueta} a #{vertice.etiqueta} es de #{pesos[vertice.valor]} de peso por la siguiente ruta: "
                    actual = vertice
                    camino = []

                    while actual.valor != origen.valor do
                        camino.push(actual)
                        actual = antecesores[actual.valor]
                    end

                    print origen.etiqueta

                    for nodo in camino.reverse
                        print " -> #{nodo.etiqueta}"
                    end
                    puts ""
                end
            end
        end
    end

    def matrizCaminos(n)
        matriz = matrizAdyacencia ** n
        return matriz
    end

    def conexo?
        vertice = @vertices[0].valor
        visitados = []
        visitados.push(vertice)

        for visitado in visitados
            adyacentes = verticesAdyacentes(Vertice.new(visitado, (64 + visitado).chr))
            for adyacente in adyacentes
                if (!visitados.include?(adyacente))
                    visitados.push(adyacente)
                end
            end
        end

        return visitados.length == @vertices.length
    end

    private
        def dijkstra(origen)
            cola = PriorityQueue.new()
            distancias = [nil]
            antecesores = [nil]
            for vertice in @vertices
                distancias.push(Float::INFINITY)
                antecesores.push(nil)
            end
            distancias[origen.valor] = 0
            
            cola.push(origen, distancias[origen.valor])
            while !cola.empty? do
                minimo = cola.pop
                for vertice in verticesAdyacentes(minimo)
                    if (distancias[vertice] > distancias[minimo.valor] + aristaEntre(minimo.valor, vertice).peso)
                        distancias[vertice] = distancias[minimo.valor] + aristaEntre(minimo.valor, vertice).peso
                        antecesores[vertice] = minimo
                        cola.push(Vertice.new(vertice, (64 + vertice).chr), distancias[vertice])
                    end
                end
            end
            return [antecesores, distancias]
        end


end