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

@Table(name = "donatorski_ugovor")
@Entity(name = "donatorski_ugovor")
public class DonatorskiUgovor implements Serializable {
    
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
    private double proc_vred;
    
    @Column
    private String opis;
    
    @Column
    private Integer kolicina;
    
    @Column
    @Temporal(TemporalType.DATE)
    private Date datum_ugovora;
    
    @ManyToOne
    @JoinColumn(name = "idStatus", referencedColumnName = "id")
    private Status status;
    
    @Column
    @Temporal(TemporalType.DATE)
    private Date datum_isporuke;
    
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

    public double getProc_vred() {
        return proc_vred;
    }

    public void setProc_vred(double proc_vred) {
        this.proc_vred = proc_vred;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Integer getKolicina() {
        return kolicina;
    }

    public void setKolicina(Integer kolicina) {
        this.kolicina = kolicina;
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

    public Date getDatum_isporuke() {
        return datum_isporuke;
    }

    public void setDatum_isporuke(Date datum_isporuke) {
        this.datum_isporuke = datum_isporuke;
    }

    public String getKomentar() {
        return komentar;
    }

    public void setKomentar(String komentar) {
        this.komentar = komentar;
    }
    
    
    
}
