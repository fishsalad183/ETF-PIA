package entityBeans;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Kompanija implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    
    @Column
    private String naziv;
    
    @Column
    private String adresa;
    
    @Column
    private String grad;
    
    @Column
    private int postanski_broj;
    
    @Column
    private String zemlja;
    
    @Column
    private String ziro_racun;
    
    @Column
    private String valuta;
    
    @Column
    private int pib;
    
    @Column
    private String telefon1;
    
    @Column
    private String telefon2;
    
    @Column
    private String telefon3;
    
    @Column
    private String telefon4;
    
    @Column
    private String telefon5;
    
    @Column
    private String email1;
    
    @Column
    private String email2;
    
    @Column
    private String email3;
    
    @Column
    private String email4;
    
    @Column
    private String email5;
    
    @Column
    private String logo;
    
    @Column
    private String web;
    
    @Column
    private String opis;
    
    @Column
    private String kontakt_osoba;
    
    @Column
    private String ko_telefon;
    
    @Column
    private String ko_email;
    
    
    @ManyToMany
    @JoinTable(
            name = "u_kontaktu",
            joinColumns = { @JoinColumn(name = "idKomp") },
            inverseJoinColumns = { @JoinColumn(name = "username") }
    )
    Set<Korisnik> kontaktiFakultet = new HashSet<>();
    

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

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public int getPostanski_broj() {
        return postanski_broj;
    }

    public void setPostanski_broj(int postanski_broj) {
        this.postanski_broj = postanski_broj;
    }

    public String getZemlja() {
        return zemlja;
    }

    public void setZemlja(String zemlja) {
        this.zemlja = zemlja;
    }

    public String getZiro_racun() {
        return ziro_racun;
    }

    public void setZiro_racun(String ziro_racun) {
        this.ziro_racun = ziro_racun;
    }

    public String getValuta() {
        return valuta;
    }

    public void setValuta(String valuta) {
        this.valuta = valuta;
    }

    public int getPib() {
        return pib;
    }

    public void setPib(int pib) {
        this.pib = pib;
    }

    public String getTelefon1() {
        return telefon1;
    }

    public void setTelefon1(String telefon1) {
        this.telefon1 = telefon1;
    }

    public String getTelefon2() {
        return telefon2;
    }

    public void setTelefon2(String telefon2) {
        this.telefon2 = telefon2;
    }

    public String getTelefon3() {
        return telefon3;
    }

    public void setTelefon3(String telefon3) {
        this.telefon3 = telefon3;
    }

    public String getTelefon4() {
        return telefon4;
    }

    public void setTelefon4(String telefon4) {
        this.telefon4 = telefon4;
    }

    public String getTelefon5() {
        return telefon5;
    }

    public void setTelefon5(String telefon5) {
        this.telefon5 = telefon5;
    }

    public String getEmail1() {
        return email1;
    }

    public void setEmail1(String email1) {
        this.email1 = email1;
    }

    public String getEmail2() {
        return email2;
    }

    public void setEmail2(String email2) {
        this.email2 = email2;
    }

    public String getEmail3() {
        return email3;
    }

    public void setEmail3(String email3) {
        this.email3 = email3;
    }

    public String getEmail4() {
        return email4;
    }

    public void setEmail4(String email4) {
        this.email4 = email4;
    }

    public String getEmail5() {
        return email5;
    }

    public void setEmail5(String email5) {
        this.email5 = email5;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public String getKontakt_osoba() {
        return kontakt_osoba;
    }

    public void setKontakt_osoba(String kontakt_osoba) {
        this.kontakt_osoba = kontakt_osoba;
    }

    public String getKo_telefon() {
        return ko_telefon;
    }

    public void setKo_telefon(String ko_telefon) {
        this.ko_telefon = ko_telefon;
    }

    public String getKo_email() {
        return ko_email;
    }

    public void setKo_email(String ko_email) {
        this.ko_email = ko_email;
    }

    public Set<Korisnik> getKontaktiFakultet() {
        return kontaktiFakultet;
    }

    public void setKontaktiFakultet(Set<Korisnik> kontaktiFakultet) {
        this.kontaktiFakultet = kontaktiFakultet;
    }
    
}
