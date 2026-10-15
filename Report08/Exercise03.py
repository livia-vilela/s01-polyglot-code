class Persona:
    def __init__(self, nome, arcano):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} | Arcano: {self.arcano}")


class Aliado:
    def __init__(self, nome, codinome):
        self.nome = nome
        self.codinome = codinome


class Lider:
    def __init__(self, codinome):
        self.codinome = codinome

        # Composição: a Persona é criada dentro do objeto Lider
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado):
        # Agregação: recebe um aliado criado fora da classe Lider
        self._equipe.append(aliado)
        print(f"{aliado.codinome} foi recrutado para os Phantom Thieves.")

    def infiltrar(self, palacio):
        print(f"\n{self.codinome} invadiu o Palácio de {palacio}!")
        self.persona.invocar()

        print("Equipe dos Phantom Thieves:")
        if not self._equipe:
            print("Equipe vazia.")
        else:
            for aliado in self._equipe:
                print(f"- {aliado.codinome} ({aliado.nome})")


def main():
    print("=== PERSONA 5 ===")
    codinome_lider = input("Digite o codinome do líder: ")
    nome_palacio = input("Digite o nome do palácio: ")

    joker = Lider(codinome_lider)

    quantidade = int(input("Quantos aliados deseja recrutar? "))

    for i in range(quantidade):
        print(f"\nCadastro do aliado {i + 1}")
        nome = input("Digite o nome do aliado: ")
        codinome = input("Digite o codinome do aliado: ")

        aliado = Aliado(nome, codinome)
        joker.recrutar(aliado)

    joker.infiltrar(nome_palacio)


if __name__ == "__main__":
    main()
