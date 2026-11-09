class Carro
  
  def initialize(carro_hash = {})
    @id = carro_hash[:id]
    @nome = carro_hash[:nome]
    @modelo = carro_hash[:modelo]
    @ano = carro_hash[:ano]
  end

  attr_accessor :id, :nome, :modelo, :ano

  def self.todos
    [
      Carro.new({ id: '1',  nome: "Fusca",    modelo: "Volkswagen", ano: 1970 }),
      Carro.new({ id: '2',  nome: "Gol",      modelo: "Volkswagen", ano: 1980 }),
      Carro.new({ id: '3',  nome: "Brasília", modelo: "Volkswagen", ano: 1973 }),
      Carro.new({ id: '4',  nome: "Opala",    modelo: "Chevrolet",  ano: 1968 }),
      Carro.new({ id: '5',  nome: "Chevette", modelo: "Chevrolet",  ano: 1973 }),
      Carro.new({ id: '6',  nome: "Monza",    modelo: "Chevrolet",  ano: 1982 }),
      Carro.new({ id: '7',  nome: "Corcel",   modelo: "Ford",       ano: 1968 }),
      Carro.new({ id: '8',  nome: "147",      modelo: "Fiat",       ano: 1976 }),
      Carro.new({ id: '9',  nome: "Uno",      modelo: "Fiat",       ano: 1984 }),
      Carro.new({ id: '10', nome: "BR-800",   modelo: "Gurgel",     ano: 1988 })
    ]
  end
end