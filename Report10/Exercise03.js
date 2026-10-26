const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function perguntar(pergunta) {
    return new Promise(resolve => rl.question(pergunta, resolve));
}

class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\nDiário Misterioso nº ${this.numero}`);

        this.#fichas.forEach(ficha => {
            console.log(ficha.descrever());
        });
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\nCabana do Mistério aberta!`);
        console.log(`Dono: ${this.dono}`);

        this.#funcionarios.forEach(funcionario => {
            console.log(
                `Funcionário: ${funcionario.nome} | Cargo: ${funcionario.cargo}`
            );
        });
    }
}

async function main() {
    const numeroDiario = Number(
        await perguntar("Número do diário: ")
    );

    const diario = new DiarioMisterioso(numeroDiario);

    const quantidadeCriaturas = Number(
        await perguntar("Quantas criaturas deseja cadastrar? ")
    );

    for (let i = 0; i < quantidadeCriaturas; i++) {
        console.log(`\nCriatura ${i + 1}`);

        const nome = await perguntar("Nome da criatura: ");
        const perigo = Number(
            await perguntar("Nível de perigo: ")
        );

        diario.anotar(nome, perigo);
    }

    diario.exibirFichas();

    console.log("\n--- Cadastro da Cabana ---");

    const dono = await perguntar("Nome do dono da cabana: ");
    const cabana = new CabanaDoMisterio(dono);

    const quantidadeFuncionarios = Number(
        await perguntar("Quantos funcionários deseja cadastrar? ")
    );

    for (let i = 0; i < quantidadeFuncionarios; i++) {
        console.log(`\nFuncionário ${i + 1}`);

        const nome = await perguntar("Nome: ");
        const cargo = await perguntar("Cargo: ");

        const funcionario = new Funcionario(nome, cargo);
        cabana.contratar(funcionario);
    }

    cabana.abrirAsPortas();

    // Composição: o diário cria as fichas.
    // Agregação: a cabana recebe funcionários já criados.

    rl.close();
}

main();