
# Exercício 2 - Overwatch
# Conceitos: herança e polimorfismo

class HeroiOverwatch:
    def __init__(self, codinome, funcao):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} usa uma suprema genérica!")


class HeroiTanque(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} (Tanque) usa uma suprema para proteger a equipe!")


class HeroiSuporte(HeroiOverwatch):
    def usar_suprema(self):
        print(f"{self.codinome} (Suporte) usa uma suprema para auxiliar a equipe!")

    def curar_equipe(self):
        print(f"{self.codinome} cura a equipe!")


def main():
    print("=== OVERWATCH ===")
    herois = []

    quantidade = int(input("Quantos heróis deseja cadastrar? "))

    for i in range(quantidade):
        print(f"\nCadastro do herói {i + 1}")
        codinome = input("Digite o codinome do herói: ")

        print("Escolha a função:")
        print("1 - Dano (herói comum)")
        print("2 - Tanque")
        print("3 - Suporte")
        opcao = input("Digite a opção: ")

        if opcao == "2":
            heroi = HeroiTanque(codinome, "Tanque")
        elif opcao == "3":
            heroi = HeroiSuporte(codinome, "Suporte")
        else:
            heroi = HeroiOverwatch(codinome, "Dano")

        herois.append(heroi)

    print("\n=== HABILIDADES DOS HERÓIS ===")
    for heroi in herois:
        heroi.usar_suprema()

        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()


if __name__ == "__main__":
    main()
