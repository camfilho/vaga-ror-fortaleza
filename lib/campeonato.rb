require_relative './partida.rb'

class Campeonato
  private

  attr_accessor :todas_partidas, :todos_jogadores

  public

  def pegar_partidas
    todas_partidas
  end

  def gerar_partidas(partidas)
    self.todas_partidas = []
    partidas.each_slice(3) do |jogos|
      partida = Partida.new(jogos)
      partida.pontuar_partida
      todas_partidas.push partida
    end
  end

  def gerar_ponto_por_jogador
    self.todos_jogadores = Hash.new(Jogador.new(nil))
    todas_partidas.each do |p|
      todos_jogadores[p.jogador1.name] = p.jogador1 + todos_jogadores[p.jogador1.name]
      todos_jogadores[p.jogador2.name] = p.jogador2 + todos_jogadores[p.jogador2.name]
    end
    todos_jogadores
  end

  def classificar
    todos_jogadores.sort_by do |_name, jg|
      [-jg.pontos_totais,
       -jg.num_vitoria_totais,
       -jg.num_vitoria_fora,
       -jg.pulos_bonus,
       jg.punicao]
    end
  end

  def gerar_pre_formato(classificado)
    posicao = 0
    classificado.map do |name, jg|
      posicao += 1

      [posicao,
       name,
       jg.pontos_totais,
       jg.num_vitoria_totais,
       jg.num_vitoria_fora,
       jg.pulos_bonus,
       jg.punicao]
    end
  end

  def gerar_relatorio
    data = 'Classificação,'\
            'Nome,Pontos Totais,Número de Vitórias,'\
            'Número de Vitórias Fora de Casa,'\
            'Pulos Bônus,'\
            "Punições\n"
    data << gerar_pre_formato(classificar).map { |p| p.join(',') }.join("\n")
    File.write('resultado.csv', data)
  end

  def self.gerar_classificacao(partidas)
    campeonato = Campeonato.new
    campeonato.gerar_partidas(partidas)
    campeonato.gerar_ponto_por_jogador
    if campeonato.gerar_relatorio
      :ok
    else
      :error
    end
  end
end
