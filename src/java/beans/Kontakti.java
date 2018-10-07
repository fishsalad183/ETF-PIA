package beans;

import entityBeans.Kompanija;
import entityBeans.Korisnik;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Kontakti implements Serializable {

    private List<Korisnik> korisnici;
    private String odabraniKorsinik;

    private final List<Kompanija> kompanije;
    private int odabranaKompanija;
    private List<Kompanija> predstavlja;
    private List<Kompanija> nePredstavlja;

    public Kontakti() {
        inicijalizujKorisnike();

        Kompanije komp = new Kompanije();
        komp.dohvatiKompanije(true);

        kompanije = komp.getKompanije();
    }
    
    private void inicijalizujKorisnike() {
        Korisnici k = new Korisnici();
        k.dohvatiKorisnike(true);
        k.postaviOdobreneKorisnike();

        korisnici = k.getOdobreniKorisnici();
    }
    
    @PostConstruct
    public void init() {
        if (!korisnici.isEmpty()) {
            odabraniKorsinik = korisnici.get(0).getUsername();
            postaviKompanijeZaKorisnika();
        }
    }
    
    public void dodajKontakt() {
        Kompanija kom = null;
        for (Kompanija k: nePredstavlja) {
            if (k.getId() == odabranaKompanija) {
                kom = k;
                break;
            }
        }
        
        Korisnik kor = dohvatiKorisnika();
        
        kom.getKontaktiFakultet().add(kor);
        
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.update(kom);
        
        session.getTransaction().commit();
        session.close();
        
        inicijalizujKorisnike();
        postaviKompanijeZaKorisnika();
        
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Kontakt u ime Fakulteta dodat", ""));
    }

    public void postaviKompanijeZaKorisnika() {
        Korisnik k = dohvatiKorisnika();
        if (k == null) {
            return;
        }
        
        predstavlja = new ArrayList<>(k.getKompanijeKojePredstavlja());
        
        nePredstavlja = new ArrayList<>(kompanije);
        Iterator<Kompanija> it = nePredstavlja.iterator();
        while (it.hasNext()) {
            Kompanija np = it.next();
            for (Kompanija kp : predstavlja) {
                if (np.getId() == kp.getId()) {
                    it.remove();
                    break;
                }
            }
        }
    }
    
    private Korisnik dohvatiKorisnika() {
//        if (odabraniKorsinik == null || odabraniKorsinik.equals("")) {
//            return null;
//        }
        for (Korisnik k : korisnici) {
            if (k.getUsername().equals(odabraniKorsinik)) {
                return k;
            }
        }
        return null;
    }

    public List<Korisnik> getKorisnici() {
        return korisnici;
    }

    public String getOdabraniKorsinik() {
        return odabraniKorsinik;
    }

    public void setOdabraniKorsinik(String odabraniKorsinik) {
        this.odabraniKorsinik = odabraniKorsinik;
    }

    public List<Kompanija> getPredstavlja() {
        return predstavlja;
    }

    public void setPredstavlja(List<Kompanija> predstavlja) {
        this.predstavlja = predstavlja;
    }

    public List<Kompanija> getNePredstavlja() {
        return nePredstavlja;
    }

    public void setNePredstavlja(List<Kompanija> nePredstavlja) {
        this.nePredstavlja = nePredstavlja;
    }

    public int getOdabranaKompanija() {
        return odabranaKompanija;
    }

    public void setOdabranaKompanija(int odabranaKompanija) {
        this.odabranaKompanija = odabranaKompanija;
    }
    
}
