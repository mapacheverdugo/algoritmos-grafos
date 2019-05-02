class Arista
    def initialize(verticeInicio, verticeFin, peso)
        @verticeInicio=verticeInicio
        @verticeFin=verticeFin
        @peso=peso
    end
    attr_reader :verticeInicio, :verticeFin, :peso
end