import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        ItemDoCardapio cafe = new ItemDoCardapio(
                "Cafe coado", 8.00);

        ItemDoCardapio curry = new ItemDoCardapio(
                "Waffle com sorvete e frutas", 25.00);

        ComboLeblanc combo = new ComboLeblanc(
                "Combo waffle + cafe", 33.00);

        CafeLeblanc leblanc = new CafeLeblanc();

        leblanc.adicionar(cafe);
        leblanc.adicionar(curry);
        leblanc.adicionar(combo);

        leblanc.mostrarCardapio();
    }
}

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        System.out.println("Cardapio do Leblanc:");

        for (ItemDoCardapio item : cardapio) {
            System.out.printf("%s - R$ %.2f%n",
                    item.getNome(), item.precoFinal());
        }
    }
}