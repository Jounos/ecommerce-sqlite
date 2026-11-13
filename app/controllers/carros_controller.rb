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

  def alterar
    carro_id = params[:id]
    carro = Carro.find(carro_id)

    carro.nome = params[:nome]
    carro.modelo = params[:modelo]
    carro.ano = params[:ano]
    carro.save

    redirect_to carros_path
  end

  def apagar
    carro_id = params[:id]
    carro = Carro.find(carro_id)
    carro.destroy

    redirect_to carros_path
  end
end
