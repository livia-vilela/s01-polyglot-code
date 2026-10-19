class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Metodo interpretar nao implementado"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome}, tocando #{instrumento}, conduz a melodia principal de #{peca}."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome}, tocando #{instrumento}, acompanha o ritmo do solista em #{peca}."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "\nRegente #{@nome} conduz a peca #{peca}."

    @orquestra.each do |instrumentista|
      instrumentista.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map do |instrumentista|
      "#{instrumentista.class}: #{instrumentista.nome}"
    end
  end
end

# MAIN

puts "Digite o nome do solista:"
nome = gets.chomp

puts "Digite o instrumento do solista:"
instrumento = gets.chomp

solista = Solista.new(nome, instrumento)

puts "\nDigite o nome do acompanhador:"
nome = gets.chomp

puts "Digite o instrumento do acompanhador:"
instrumento = gets.chomp

acompanhador = Acompanhador.new(nome, instrumento)

puts "\nDigite o nome do regente:"
nome_regente = gets.chomp

regente = Regente.new(nome_regente)

regente.convocar(solista)
regente.convocar(acompanhador)

puts "\nDigite o nome da peca musical:"
peca = gets.chomp

regente.reger(peca)

puts "\n--- ESCALACAO ---"
regente.escalacao.each do |integrante|
  puts integrante
end

# Teste da classe base (gera erro)
instrumentista = Instrumentista.new("Aluno", "Flauta")
# instrumentista.interpretar("Peca")
