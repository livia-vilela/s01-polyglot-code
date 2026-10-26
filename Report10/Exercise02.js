const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function perguntar(pergunta) {
    return new Promise(resolve => rl.question(pergunta, resolve));
}

class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloPistola);
    }

    usarHabilidade() {
        throw new Error("O agente deve implementar sua habilidade.");
    }

    entrarEmCombate() {
        console.log(`\nAgente: ${this.codinome}`);
        console.log(`Pistola: ${this.#pistola.modelo}`);
        console.log(`Habilidade: ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return "Bloqueia a visão inimiga com fumaça.";
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return "Usa habilidades para localizar inimigos.";
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return "Avança para abrir espaço para a equipe.";
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\nEsquadrão ${this.nome} iniciando a partida!`);

        this.#agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.#agentes.filter(
            agente => agente instanceof Controlador
        );
    }
}

async function main() {
    const nomeEsquadrao = await perguntar("Nome do esquadrão: ");
    const agentes = [];

    const quantidade = Number(
        await perguntar("Quantos agentes deseja cadastrar? ")
    );

    for (let i = 0; i < quantidade; i++) {
        console.log(`\nCadastro do agente ${i + 1}`);

        const nome = await perguntar("Codinome: ");
        const pistola = await perguntar("Modelo da pistola: ");

        console.log("1 - Controlador");
        console.log("2 - Iniciador");
        console.log("3 - Duelista");

        const tipo = await perguntar("Escolha a função do agente: ");

        if (tipo === "1") {
            agentes.push(new Controlador(nome, pistola));
        } else if (tipo === "2") {
            agentes.push(new Iniciador(nome, pistola));
        } else if (tipo === "3") {
            agentes.push(new Duelista(nome, pistola));
        } else {
            console.log("Função inválida. Agente não cadastrado.");
        }
    }

    const esquadrao = new Esquadrao(nomeEsquadrao, agentes);

    esquadrao.iniciarPartida();

    console.log("\n--- Controladores do esquadrão ---");

    esquadrao.listarControladores().forEach(agente => {
        console.log(agente.codinome);
    });

    rl.close();
}

main();