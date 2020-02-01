class Jogador
  attr_reader :name
  attr_accessor :num_vitoria_fora,
                :pulos_bonus,
                :punicao,
                :pulos,
                :pontos_empate,
                :num_vitoria_casa

  private

  PONTOS_POR_VITORIA = 3

  private_constant :PONTOS_POR_VITORIA

  def initialize(name)
    @name = name

    @num_vitoria_casa = 0
    @num_vitoria_fora = 0

    @pontos_empate = 0
    @punicao = 0

    @pulos = 0
    @pulos_bonus = 0
  end

  def pontos_vitoria
    (num_vitoria_casa + num_vitoria_fora) * PONTOS_POR_VITORIA
  end

  public

  def pontos_totais
    (pontos_vitoria + pontos_empate) - punicao
  end
end
