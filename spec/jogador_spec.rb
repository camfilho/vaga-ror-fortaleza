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
    it 'returns the total amount of the score' do
      @jogador.num_vitoria_fora = 1
      @jogador.num_vitoria_casa = 1
      @jogador.pontos_empate = 2
      pontos = (1 + 1) * 3 + 2
      expect(@jogador.pontos_totais).to eql(pontos)
    end
  end

  describe '#num_vitoria_totais' do
    it 'returns the total amount of victories' do
      @jogador.num_vitoria_casa = 1
      @jogador.num_vitoria_fora = 1
      result = @jogador.num_vitoria_casa + @jogador.num_vitoria_fora
      expect(@jogador.num_vitoria_totais).to eq(result)
    end
  end

  describe '#pulos_totais' do
    it 'returns the sum of jumps and bonus jumps' do
      @jogador.pulos = 11
      @jogador.pulos_bonus = 2
      expect(@jogador.pulos_totais).to eq(@jogador.pulos + @jogador.pulos_bonus)
    end
  end

  describe '#+' do
    it 'returns the sum of two instance of class Jogador' do
      @jogador2 = Jogador.new('New Jogador')

      @jogador.num_vitoria_fora = 1
      @jogador.num_vitoria_casa = 1
      @jogador.pontos_empate = 1
      @jogador.punicao = 1
      @jogador.pulos = 1
      @jogador.pulos_bonus = 1

      @jogador2.num_vitoria_fora = 1
      @jogador2.num_vitoria_casa = 1
      @jogador2.pontos_empate = 1
      @jogador2.punicao = 1
      @jogador2.pulos = 1
      @jogador2.pulos_bonus = 1

      result = @jogador + @jogador2
      expect(result.num_vitoria_fora).to eql(2)
      expect(result.num_vitoria_casa).to eql(2)
      expect(result.pontos_empate).to eql(2)
      expect(result.punicao).to eql(2)
      expect(result.pulos).to eql(2)
      expect(result.pulos_bonus).to eql(2)
    end
  end
end
