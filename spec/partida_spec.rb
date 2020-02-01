require_relative '../lib/partida.rb'

describe Partida do

  describe '#pontuar_partida' do
    context 'partida com jogador1 vitorioso' do
      it 'adiciona ponto de vitoria para jogador1' do
        match = [%w[P1 x P2 4 x 0],
                 %w[P1 x P2 0 x 4],
                 %w[P1 x P2 9 x 2]]
        @partida = Partida.new(match)
        @partida.pontuar_partida
        expect(@partida.jogador1.num_vitoria_casa).to eq(1)
      end
    end

    context 'partida com jogador2 vitorioso' do
      it 'adiciona ponto de vitoria fora para jogador2' do
        match = [%w[P1 x P2 0 x 4],
                 %w[P1 x P2 4 x 0],
                 %w[P1 x P2 2 x 9]]
        @partida = Partida.new(match)
        @partida.pontuar_partida
        expect(@partida.jogador2.num_vitoria_fora).to eq(1)
      end
    end

    context 'partida com empate' do
      it 'adiciona ponto de empate para visitante' do
        match = [%w[P1 x P2 0 x 4],
                 %w[P1 x P2 4 x 0],
                 %w[P1 x P2 2 x 2]]
        @partida = Partida.new(match)
        @partida.pontuar_partida
        expect(@partida.jogador2.pontos_empate).to eq(2)
      end
    end
  end
end
