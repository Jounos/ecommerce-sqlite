class CarrosController < ApplicationController
  def index
    @carros = Carro.all
  end
  
  def show
    carro_id = params[:id]
    @carro = Carro.find(carro_id)
  end

  def editar
    carro_id = params[:id]
    @carro = Carro.find(carro_id)
  end

  def novo
  end

  def criar
    Carro.create(params.permit(:nome, :modelo, :ano))
    redirect_to carros_path
  end
end
