require './lib/jogador.rb'

class Partida
  attr_accessor :jogador1, :jogador2

  private

  attr_accessor :jogos

  def initialize(partida)
    @jogos = partida
    @jogador1 = nil
    @jogador2 = nil
    @winner = nil
    @pulos_por_partida1 = []
    @pulos_por_partida2 = []
  end

  def jogar
    definir_jogadores
    jogos.each do |jogo|
      @pulos_por_partida1.push jogo[3].to_i
      @pulos_por_partida2.push jogo[5].to_i
    end
    adicionar_pulos
    adicionar_bonus_maior_que_dez
    adicionar_dez_porcento
    adicionar_punicao
  end

  def definir_jogadores
    @jogador1 = Jogador.new(jogos.first[0])
    @jogador2 = Jogador.new(jogos.first[2])
  end

  def adicionar_pulos
    jogador1.pulos = @pulos_por_partida1.sum
    jogador2.pulos = @pulos_por_partida2.sum
  end

  def adicionar_bonus_maior_que_dez
    jogador1
      .pulos_bonus += @pulos_por_partida1
        .reduce(0) { |acc, pulos| pulos > 10 ? acc + 2 : acc }
    jogador2
      .pulos_bonus += @pulos_por_partida2
        .reduce(0) { |acc, pulos| pulos > 10 ? acc + 2 : acc }
  end

  def pulos_iguais?(pulos)
    pulos.uniq.length == 1
  end

  def adicionar_dez_porcento
    jogador1.pulos_bonus = (jogador1.pulos_totais * 1.1).round if pulos_iguais? @pulos_por_partida1
    return unless pulos_iguais? @pulos_por_partida2

    jogador2.pulos = (jogador2.pulos_totais * 1.1).round
  end

  def punir?(pulos)
    pulos.sum < 3
  end

  def adicionar_punicao
    jogador1.punicao += 1 if punir? @pulos_por_partida1
    jogador2.punicao += 1 if punir? @pulos_por_partida2
  end

  def winner?
    return true if jogador1.pulos_totais > jogador2.pulos_totais
    return true if jogador2.pulos_totais > jogador1.pulos_totais

    false
  end

  def winner
    jog1 = jogador1
    jog2 = jogador2
    @winner ||= jog1.pulos_totais > jog2.pulos_totais ? jog1 : jog2
  end

  def pontuar_winner
    winner.num_vitoria_casa += 1 if winner.name == jogador1.name
    winner.num_vitoria_fora += 1 if winner.name == jogador2.name
  end

  def pontuar_visitante
    jogador2.pontos_empate += 2
  end

  public

  def pontuar_partida
    jogar
    if winner?
      pontuar_winner
    else
      pontuar_visitante
    end
  end
end
