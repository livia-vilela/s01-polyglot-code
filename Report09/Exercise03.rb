class PhoneWave
  def enviar_dmail(mensagem)
    puts "\nMensagem: #{mensagem}"
    puts "D-mail enviado para o passado!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    # COMPOSICAO: o laboratorio cria seu PhoneWave
    @phonewave = PhoneWave.new

    # Array de membros
    @membros = []
  end

  # AGREGACAO: recebe membros ja existentes
  def admitir(membro)
    @membros << membro
    puts "Membro admitido: #{membro.numero} - #{membro.nome}"
  end

  def experimento(mensagem)
    puts "\n--- MEMBROS NO EXPERIMENTO ---"

    @membros.each do |membro|
      puts "#{membro.numero} - #{membro.nome}"
    end

    @phonewave.enviar_dmail(mensagem)
  end
end

# MAIN

puts "Digite o numero do primeiro membro:"
numero = gets.chomp.to_i

puts "Digite o nome do primeiro membro:"
nome = gets.chomp

membro1 = MembroDoLab.new(numero, nome)

puts "\nDigite o numero do segundo membro:"
numero = gets.chomp.to_i

puts "Digite o nome do segundo membro:"
nome = gets.chomp

membro2 = MembroDoLab.new(numero, nome)

laboratorio = LaboratorioDeGadgets.new

laboratorio.admitir(membro1)
laboratorio.admitir(membro2)

puts "\nDigite a mensagem que sera enviada ao passado:"
mensagem = gets.chomp

laboratorio.experimento(mensagem)
