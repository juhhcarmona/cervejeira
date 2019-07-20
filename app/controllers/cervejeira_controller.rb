class CervejeiraController < ApplicationController

  def index
  end

  def get_cerveja
    redirect_to cerveja_path(temperatura: params[:temperatura])
  end

  def cerveja
    @temperatura = params[:temperatura]
    resp = Services::Cervejeira.new().melhor_cerveja_por_temperatura(@temperatura)

    if resp.code == 200
      cerveja = JSON.parse(resp.body)["cerveja"]
      @estilo = cerveja["estilo"]
    elsif resp.code == 404
      @estilo = "Cerveja não encontrada"
    else
      @error = "Oh não! Parece que algo deu errado e não conseguimos achar sua cerveja =("
    end
  end

end
