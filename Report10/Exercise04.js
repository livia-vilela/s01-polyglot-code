const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function perguntar(pergunta) {
    return new Promise(resolve => rl.question(pergunta, resolve));
}

class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(
            `${this.nome} ataca ${alvo.nome}, Aranha nº ${alvo.numero}, com Nen!`
        );
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} fortalece seu corpo e golpeia ${alvo.nome}, Aranha nº ${alvo.numero}!`
        );
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} transforma sua aura em eletricidade e ataca ${alvo.nome}, Aranha nº ${alvo.numero}!`
        );
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(
            `${this.nome} materializa correntes e ataca ${alvo.nome}, Aranha nº ${alvo.numero}!`
        );
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\nTrupe Fantasma avistada em ${this.cidade}:`);

        this.#aranhas.forEach(aranha => {
            console.log(`Aranha nº ${aranha.numero}: ${aranha.nome}`);
        });
    }

    buscarAranha(numero) {
        return this.#aranhas.find(
            aranha => aranha.numero === numero
        );
    }
}

async function main() {
    const cidade = await perguntar("Cidade onde a Trupe foi avistada: ");

    const aranhas = [];

    const quantidade = Number(
        await perguntar("Quantas Aranhas deseja cadastrar? ")
    );

    for (let i = 0; i < quantidade; i++) {
        console.log(`\nAranha ${i + 1}`);

        const nome = await perguntar("Nome da Aranha: ");
        const numero = Number(
            await perguntar("Número da Aranha: ")
        );

        aranhas.push(new Aranha(nome, numero));
    }

    const trupe = new TrupeFantasma(cidade, aranhas);

    trupe.revelarAranhas();

    const numeroAlvo = Number(
        await perguntar("\nDigite o número da Aranha que deseja atacar: ")
    );

    const alvo = trupe.buscarAranha(numeroAlvo);

    if (alvo) {
        console.log("\n--- Cadastro dos usuários de Nen ---");

        const nomeIntensificador = await perguntar(
            "Nome do Intensificador: "
        );

        const nomeTransmutador = await perguntar(
            "Nome do Transmutador: "
        );

        const nomeMaterializador = await perguntar(
            "Nome do Materializador: "
        );

        const usuarios = [
            new Intensificador(nomeIntensificador),
            new Transmutador(nomeTransmutador),
            new Materializador(nomeMaterializador)
        ];

        console.log("\n--- Ataques ---");

        usuarios.forEach(usuario => {
            usuario.atacar(alvo);
        });
    } else {
        console.log("Aranha não encontrada.");
    }

    rl.close();
}

main();