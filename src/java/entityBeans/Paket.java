package entityBeans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Paket implements Serializable {
    
    @Id
    @GeneratedValue
    @Column
    private int id;
    
    @Column
    private String naziv;
    
    @Column
    private double vrednost;
    
    @Column
    private int trajanje;
    
    @Column
    private int maks_komp;
    
    
    @ManyToMany
    @JoinTable(
            name = "ima",
            joinColumns = { @JoinColumn(name = "idPaket") },
            inverseJoinColumns = { @JoinColumn(name = "idStavka") }
    )
    Set<Stavka> stavke = new HashSet<>();
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public double getVrednost() {
        return vrednost;
    }

    public void setVrednost(double vrednost) {
        this.vrednost = vrednost;
    }

    public int getTrajanje() {
        return trajanje;
    }

    public void setTrajanje(int trajanje) {
        this.trajanje = trajanje;
    }

    public int getMaks_komp() {
        return maks_komp;
    }

    public void setMaks_komp(int maks_komp) {
        this.maks_komp = maks_komp;
    }

    public Set<Stavka> getStavke() {
        return stavke;
    }

    public void setStavke(Set<Stavka> stavke) {
        this.stavke = stavke;
    }
    
}
