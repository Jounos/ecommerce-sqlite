class CarrosController < ApplicationController
  def index
    @carros = Carro.all
  end
  
  def show
    carro_id = params[:id]
    @carro = Carro.find(carro_id)
  end
end
