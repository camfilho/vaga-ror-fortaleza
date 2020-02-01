#!/usr/bin/env ruby
require_relative '../lib/campeonato'

file = File.open('./jogadas.txt')

partidas = file.readlines.map(&:chomp)
jogos = partidas[1..-1].map { |jogo| jogo.split(' ') }

Campeonato.gerar_classificacao(jogos)

file.close