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

  def num_vitoria_totais
    num_vitoria_casa + num_vitoria_fora
  end

  def pulos_totais
    pulos + pulos_bonus
  end

  def +(other)
    jg = Jogador.new(other.name)
    jg.num_vitoria_fora = num_vitoria_fora + other.num_vitoria_fora
    jg.num_vitoria_casa = other.num_vitoria_casa + num_vitoria_casa
    jg.pontos_empate = other.pontos_empate + pontos_empate
    jg.punicao = other.punicao + punicao
    jg.pulos = other.pulos + pulos
    jg.pulos_bonus = other.pulos_bonus + pulos_bonus
    jg
  end
end
