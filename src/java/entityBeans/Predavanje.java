package entityBeans;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Predavanje implements Serializable {
    
    @Id
    @GeneratedValue
    @Column
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "idKomp", referencedColumnName = "id")
    private Kompanija kompanija;
    
    @Column
    private String naslov;
    
    @Column
    private String naslov_en;
    
    @Column
    private String opis;
    
    @Column
    private String opis_en;
    
    @Column
    private Date datum;
    
    @Column
    private Time vreme;
    
    @Column
    private String sala;
    
    @Column
    private String predavac;
    
    @Column
    private String biografija;
    
    @Lob
    @Column
    private byte[] fajl;
    
    @Lob
    @Column
    private byte[] slika;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Kompanija getKompanija() {
        return kompanija;
    }

    public void setKompanija(Kompanija kompanija) {
        this.kompanija = kompanija;
    }

    public String getNaslov() {
        return naslov;
    }

    public void setNaslov(String naslov) {
        this.naslov = naslov;
    }

    public String getNaslov_en() {
        return naslov_en;
    }

    public void setNaslov_en(String naslov_en) {
        this.naslov_en = naslov_en;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getOpis_en() {
        return opis_en;
    }

    public void setOpis_en(String opis_en) {
        this.opis_en = opis_en;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public Time getVreme() {
        return vreme;
    }

    public void setVreme(Time vreme) {
        this.vreme = vreme;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public String getPredavac() {
        return predavac;
    }

    public void setPredavac(String predavac) {
        this.predavac = predavac;
    }

    public String getBiografija() {
        return biografija;
    }

    public void setBiografija(String biografija) {
        this.biografija = biografija;
    }

    public byte[] getFajl() {
        return fajl;
    }

    public void setFajl(byte[] fajl) {
        this.fajl = fajl;
    }

    public byte[] getSlika() {
        return slika;
    }

    public void setSlika(byte[] slika) {
        this.slika = slika;
    }
    
}
