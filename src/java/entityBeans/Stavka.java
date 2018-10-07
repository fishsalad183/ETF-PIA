package entityBeans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Stavka implements Serializable {
    public static final int LOGO_PANO = 1;
    public static final int LOGO_BROSURA = 2;
    public static final int BANER_STRANA_PARTNERI = 3;
    public static final int OGLASAVANJE_DOGADJAJI = 4;
    public static final int PREDAVANJA = 5;
    public static final int OPIS = 6;
    public static final int OGLASAVANJE_POSAO = 7;
    
    @Id
    @Column
    private int id;
    
    @Column
    private String naziv;
    
    @Column
    private String opis;
    
    
    @ManyToMany(mappedBy = "stavke")
    private Set<Paket> paketi = new HashSet<>();
    

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

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Set<Paket> getPaketi() {
        return paketi;
    }

    public void setPaketi(Set<Paket> paketi) {
        this.paketi = paketi;
    }
    
}
