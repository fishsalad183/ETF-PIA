package entityBeans;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

@Table(name = "novcani_ugovor")
@Entity(name = "novcani_ugovor")
public class NovcaniUgovor implements Serializable {
    
    @Id
    @GeneratedValue
    @Column
    private int id;
    
    @ManyToOne
    @JoinColumn(name = "idKomp", referencedColumnName = "id")
    private Kompanija kompanija;
    
    @ManyToOne
    @JoinColumn(name = "idPaket", referencedColumnName = "id")
    private Paket paket;
    
    @Column
    private double vrednost;
    
    @Column
    @Temporal(TemporalType.DATE)
    private Date datum_ugovora;
    
    @ManyToOne
    @JoinColumn(name = "idStatus", referencedColumnName = "id")
    private Status status;
    
    @Column
    @Type(type = "boolean")
    private boolean faktura_poslata;
    
    @Column
    @Type(type = "boolean")
    private boolean uplata_izvrsena;
    
    @Column
    @Temporal(TemporalType.DATE)
    private Date datum_uplate;
    
    @Column
    private String komentar;

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

    public Paket getPaket() {
        return paket;
    }

    public void setPaket(Paket paket) {
        this.paket = paket;
    }

    public double getVrednost() {
        return vrednost;
    }

    public void setVrednost(double vrednost) {
        this.vrednost = vrednost;
    }

    public Date getDatum_ugovora() {
        return datum_ugovora;
    }

    public void setDatum_ugovora(Date datum_ugovora) {
        this.datum_ugovora = datum_ugovora;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public boolean isFaktura_poslata() {
        return faktura_poslata;
    }

    public void setFaktura_poslata(boolean faktura_poslata) {
        this.faktura_poslata = faktura_poslata;
    }

    public boolean isUplata_izvrsena() {
        return uplata_izvrsena;
    }

    public void setUplata_izvrsena(boolean uplata_izvrsena) {
        this.uplata_izvrsena = uplata_izvrsena;
    }

    public Date getDatum_uplate() {
        return datum_uplate;
    }

    public void setDatum_uplate(Date datum_uplate) {
        this.datum_uplate = datum_uplate;
    }

    public String getKomentar() {
        return komentar;
    }

    public void setKomentar(String komentar) {
        this.komentar = komentar;
    }
    
}
