class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preco invalido!"
    end
  end

  def ficha
    "Drink: #{nome} | Preco: R$ #{preco}"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super} | Lenda homenageada: #{lenda}"
  end
end

# MAIN

drink1 = CoquetelAfterlife.new("Jackie Welles", 35)
drink2 = DrinkDeLenda.new("Johnny Silverhand", 80, "Johnny Silverhand")
drink3 = DrinkDeLenda.new("David Martinez", 65, "David Martinez")

cardapio = [drink1, drink2, drink3]

cardapio.each do |drink|
  puts drink.ficha
end

puts "\nDigite o novo preco do segundo drink:"
drink2.preco = gets.chomp.to_f

puts drink2.ficha

# Como nome possui apenas attr_reader, esta linha gera erro.
# drink2.nome = "Novo nome"
