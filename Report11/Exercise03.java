import java.util.HashMap;

public class Main {
    public static void main(String[] args) {

        Alienigena alien = new Alienigena("ET");

        EspiritoYoukai espirito =
                new EspiritoYoukai("Guerreiro");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Parque", alien);
        mapa.registrar("Escola", espirito);

        mapa.investigar("Parque");
        mapa.investigar("Escola");
        mapa.investigar("Biblioteca");
    }
}

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome
                + " aparece com sua nave e emite um raio de luz!");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome
                + " surge entre a nevoa e assusta quem investiga!");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        System.out.println("Investigando: " + local);

        Sobrenatural ser = avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local esta tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}