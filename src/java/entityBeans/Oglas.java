package entityBeans;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Type;

@Entity
public class Oglas implements Serializable {
    
    @Id
    @GeneratedValue
    @Column
    private int id;
    
    @Column
    private String naslov;
    
    @Column
    private String opis;
    
    @Column
    @Type(type = "boolean")
    private boolean praksa;
    
    @Column
    @Type(type = "boolean")
    private boolean posao;
    
    @Column(columnDefinition = "DATETIME")
    private Timestamp datum_i_vreme_unosenja;
    
    @Lob
    @Column
    private byte[] fajl;
    
    @ManyToOne
    @JoinColumn(name = "idKomp", referencedColumnName = "id")
    private Kompanija kompanija;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaslov() {
        return naslov;
    }

    public void setNaslov(String naslov) {
        this.naslov = naslov;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public boolean isPraksa() {
        return praksa;
    }

    public void setPraksa(boolean praksa) {
        this.praksa = praksa;
    }

    public boolean isPosao() {
        return posao;
    }

    public void setPosao(boolean posao) {
        this.posao = posao;
    }

    public Timestamp getDatum_i_vreme_unosenja() {
        return datum_i_vreme_unosenja;
    }

    public void setDatum_i_vreme_unosenja(Timestamp datum_i_vreme_unosenja) {
        this.datum_i_vreme_unosenja = datum_i_vreme_unosenja;
    }

    public byte[] getFajl() {
        return fajl;
    }

    public void setFajl(byte[] fajl) {
        this.fajl = fajl;
    }

    public Kompanija getKompanija() {
        return kompanija;
    }

    public void setKompanija(Kompanija kompanija) {
        this.kompanija = kompanija;
    }
    
}
