
module Depoente
  def depor
    raise NotImplementedError, "A classe deve implementar depor"
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard!"
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} declara que viu o suspeito sair do local do crime."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def initialize(nome, alibi)
    super(nome)
    @alibi = alibi
  end

  def depor
    puts "#{nome} apresenta seu alibi: #{@alibi}."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "\n--- Investigacao: #{@caso} ---"

    @envolvidos.each do |envolvido|
      envolvido.depor
    end
  end

  def acionar_scotland_yard
    puts "\n--- Acionamento da Scotland Yard ---"

    detidos = @envolvidos.select do |envolvido|
      envolvido.respond_to?(:ser_detido)
    end

    detidos.each do |envolvido|
      envolvido.ser_detido
    end
  end
end

# MAIN

testemunha = TestemunhaOcular.new("Watson")

suspeito1 = SuspeitoDoCrime.new(
  "Professor Moriarty",
  "Estava em casa no horario do crime"
)

suspeito2 = SuspeitoDoCrime.new(
  "Sebastian Moran",
  "Estava em um hotel"
)

investigacao = Investigacao.new("O roubo das joias")

investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
