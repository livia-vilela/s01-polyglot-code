const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function perguntar(pergunta) {
    return new Promise(resolve => rl.question(pergunta, resolve));
}

class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida = Math.max(0, this.#vida - pontos);
        console.log(`${this.apelido} agora tem ${this.#vida} de vida.`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} ataca ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, "Água", vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Jato d'Água!`);
        alvo.sofrerDano(20);
    }
}

class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, "Planta", vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Chicote de Vinha!`);
        alvo.sofrerDano(15);
    }
}

async function main() {
    const nomeSquirtle = await perguntar("Apelido do Squirtle: ");
    const vidaSquirtle = Number(await perguntar("Vida inicial do Squirtle: "));

    const nomeBulbasaur = await perguntar("Apelido do Bulbasaur: ");
    const vidaBulbasaur = 30;

    const squirtle = new Squirtle(nomeSquirtle, vidaSquirtle);
    const bulbasaur = new Bulbasaur(nomeBulbasaur, vidaBulbasaur);

    console.log("\n--- Batalha Pokémon ---");

    bulbasaur.atacar(squirtle);
    squirtle.atacar(bulbasaur);
    squirtle.atacar(bulbasaur);

    console.log(`\nVida final de ${squirtle.apelido}: ${squirtle.vida}`);
    console.log(`Vida final de ${bulbasaur.apelido}: ${bulbasaur.vida}`);

    // console.log(squirtle.#vida); // Erro: atributo privado.

    rl.close();
}

main();