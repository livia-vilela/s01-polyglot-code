from abc import ABC, abstractmethod


class IUnidadeDeRede(ABC):
    @abstractmethod
    def executar_invasao(self):
        pass


class Cyberdeck:
    def __init__(self, modelo):
        self.modelo = modelo


class OperadorNetrunner(IUnidadeDeRede):
    def __init__(self, nome, modelo_cyberdeck):
        self.nome = nome

        # Composição: o Cyberdeck é criado dentro do Netrunner
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(
            f"Netrunner {self.nome}, usando o cyberdeck "
            f"{self.cyberdeck.modelo}, está quebrando o gelo (ICE) de um servidor."
        )


class DroneDeVigilancia(IUnidadeDeRede):
    def __init__(self, codigo):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"Drone {self.codigo} está interceptando o sinal da rede.")


class CelulaHacker:
    def __init__(self, nome, membros):
        self.nome = nome

        # A célula recebe unidades que já foram criadas
        self.membros = membros

    def iniciar_ataque(self):
        print(f"\nCélula hacker '{self.nome}' iniciou o ataque!")

        # Polimorfismo: cada unidade executa seu próprio método
        for membro in self.membros:
            membro.executar_invasao()


def main():
    print("=== CYBERPUNK ===")
    nome_celula = input("Digite o nome da célula hacker: ")
    membros = []

    quantidade = int(input("Quantas unidades deseja cadastrar? "))

    for i in range(quantidade):
        print(f"\nCadastro da unidade {i + 1}")
        print("1 - Operador Netrunner")
        print("2 - Drone de vigilância")
        tipo = input("Escolha o tipo de unidade: ")

        if tipo == "1":
            nome = input("Digite o nome do Netrunner: ")
            modelo = input("Digite o modelo do Cyberdeck: ")
            unidade = OperadorNetrunner(nome, modelo)
        else:
            codigo = input("Digite o código do drone: ")
            unidade = DroneDeVigilancia(codigo)

        membros.append(unidade)

    celula = CelulaHacker(nome_celula, membros)
    celula.iniciar_ataque()


if __name__ == "__main__":
    main()
