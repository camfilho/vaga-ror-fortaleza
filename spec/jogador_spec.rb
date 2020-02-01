require_relative '../lib/jogador.rb'

describe Jogador do

  before(:each) do
    @jogador = described_class.new('Player Name')
  end

  describe '#initialize' do
    it 'starts the instance variables with zero' do
      expect(@jogador.num_vitoria_fora).to eql(0)
      expect(@jogador.pulos_bonus).to eql(0)
      expect(@jogador.punicao).to eql(0)
      expect(@jogador.pulos).to eql(0)
      expect(@jogador.pontos_empate).to eql(0)
      expect(@jogador.num_vitoria_casa).to eql(0)
    end
  end

  describe '#pontos_totais' do
    subject { described_class.new('Player Name') }
    it 'returns the total amount of the score' do
      subject.num_vitoria_fora = 1
      subject.num_vitoria_casa = 1
      subject.pontos_empate = 2
      pontos = (1 + 1) * 3 + 2
      expect(subject.pontos_totais).to eql(pontos)
    end
  end
end
