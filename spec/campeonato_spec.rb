require_relative '../lib/campeonato.rb'

describe Campeonato do
  describe 'Campeonato#gerar_classificacao' do
    it 'returns ok' do
      partidas = [
        %w[P1 x P2 4 x 0],
        %w[P1 x P2 4 x 3],
        %w[P1 x P2 4 x 3],
        %w[P2 x P1 0 x 4],
        %w[P2 x P1 0 x 4],
        %w[P2 x P1 3 x 4]
      ]
      expect(Campeonato.gerar_classificacao(partidas)).to eq(:ok)
    end
  end
end
