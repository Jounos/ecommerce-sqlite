class CarrosController < ApplicationController
  def index
    @carros = Carro.todos
  end
  
  def show
    carros = Carro.todos
    carro_id = params[:id]
    @carro = carros.find{ |c| c.id == carro_id }
    puts @carro.inspect
    @carro
  end
end
