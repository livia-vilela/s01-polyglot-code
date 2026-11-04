import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        Slime slime = new Slime("Slime azul");

        Mandragora mandragora =
                new Mandragora("Mandragora gigante");

        Cozinheiro cozinheiro =
                new Cozinheiro("Senshi", "Ferro fundido");

        cozinheiro.adicionarIngrediente(slime);
        cozinheiro.adicionarIngrediente(mandragora);

        cozinheiro.servirBanquete();
    }
}

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Refogar com alho e ervas ate ficar dourado.";
    }
}

class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Assar com azeite e ervas aromaticas.";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;

        this.panela = new Panela(materialDaPanela);

        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome);

        System.out.println("Panela: "
                + panela.getMaterial());

        System.out.println("Ingredientes do banquete:");

        for (Monstro monstro : ingredientes) {
            System.out.println("- " + monstro.getNome()
                    + ": " + monstro.receita());
        }
    }
}

/*
COMPOSIÇÃO:
A panela representa composição porque é criada
dentro do construtor do Cozinheiro. Ela pertence
ao cozinheiro.

AGREGAÇÃO:
Os monstros representam agregação porque são
criados fora da classe Cozinheiro e depois
adicionados a sua lista de ingredientes.
*/