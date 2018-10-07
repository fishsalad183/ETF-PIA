package entityBeans;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Korisnik implements Serializable {
    public static final int NEODOBREN = -1;
    public static final int CLAN = 0;
    public static final int IT_MENADZER = 1;
    public static final int ADMIN = 2;
    
    @Id
    @Column
    private String username;
    
    @Column
    private String password;
    
    @Column
    private String ime;
    
    @Column
    private String prezime;
    
    @Column
    private String email;
    
    @Column
    private String institucija;
    
    @Column
    private char pol;
    
    @Column
    @Temporal(TemporalType.DATE)
    private Date datum_rodjenja;
    
    @Lob
    @Column
    private byte[] slika;
    
    @Column
    private String linkedin;
    
    @Column
    private int tip;
    
    
    @ManyToMany(mappedBy = "kontaktiFakultet")
    private Set<Kompanija> kompanijeKojePredstavlja = new HashSet<>();
    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getInstitucija() {
        return institucija;
    }

    public void setInstitucija(String institucija) {
        this.institucija = institucija;
    }

    public char getPol() {
        return pol;
    }

    public void setPol(char pol) {
        this.pol = pol;
    }

    public Date getDatum_rodjenja() {
        return datum_rodjenja;
    }

    public void setDatum_rodjenja(Date datum_rodjenja) {
        this.datum_rodjenja = datum_rodjenja;
    }

    public byte[] getSlika() {
        return slika;
    }

    public void setSlika(byte[] slika) {
        this.slika = slika;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }

    public int getTip() {
        return tip;
    }

    public void setTip(int tip) {
        this.tip = tip;
    }

    public Set<Kompanija> getKompanijeKojePredstavlja() {
        return kompanijeKojePredstavlja;
    }

    public void setKompanijeKojePredstavlja(Set<Kompanija> kompanijeKojePredstavlja) {
        this.kompanijeKojePredstavlja = kompanijeKojePredstavlja;
    }
    
    
//    public static List<Kompanija> pretvoriKompanijeKojePredstavljaUListu(Korisnik k) {
//        return new ArrayList<>(k.kompanijeKojePredstavlja);
//    }
    
}
