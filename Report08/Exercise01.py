class MortoVivo:
    def __init__(self, nome, almas, estus):
        self.nome = nome
        self._almas = almas
        self.__estus = 0
        self.set_estus(estus)

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    def mostrar_status(self):
        return (
            f"Morto-vivo {self.nome} | "
            f"Almas: {self._almas} | "
            f"Estus: {self.__estus}"
        )

class Clerigo(MortoVivo):
    def __init__(self, nome, almas, estus, milagre):
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return (
            f"{super().mostrar_status()} | "
            f"Milagre: {self.milagre}"
        )


def main():
    clerigo = Clerigo("Petrus", 2000, 5, "Lança de Luz")

    print(clerigo.mostrar_status())

    clerigo.set_estus(15)
    print(clerigo.mostrar_status())

    clerigo.set_estus(10)
    print(clerigo.mostrar_status())

    #print(clerigo.__estus)




if __name__ == "__main__":
    main()
