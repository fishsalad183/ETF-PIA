package beans;

import entityBeans.Kompanija;
import entityBeans.Korisnik;
import entityBeans.Predavanje;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class DodajPredavanje implements Serializable {

    private Predavanje novoPredavanje = new Predavanje();

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    private final List<Kompanija> listaKompanija;
    private int idKompanije;
    private Date datum;
    private Date vreme;

    public DodajPredavanje() {
        FacesContext fc = FacesContext.getCurrentInstance();
        HttpSession hs = (HttpSession) fc.getExternalContext().getSession(false);
        Korisnik korisnik = (Korisnik) hs.getAttribute("user");
        listaKompanija = new ArrayList<>(korisnik.getKompanijeKojePredstavlja());

        Ugovori ugovori = new Ugovori();
        ugovori.dohvatiUgovore();
        List<Kompanija> aktivne = ugovori.dohvatiKompanijeSaAktivnimUgovorima();

        DodajOglas.ukloniNeaktivne(listaKompanija, aktivne);
    }

    public void dodajPredavanje(UploadBeanPredavanje upload) {
        novoPredavanje.setDatum(new java.sql.Date(datum.getTime()));
        novoPredavanje.setVreme(new java.sql.Time(vreme.getHours(), vreme.getMinutes(), 0));

        byte[] fajl = null;
        byte[] slika = null;
        try {
            fajl = UploadBeanPredavanje.pretvoriUNizBajtova(upload.getFajl());
            slika = UploadBeanPredavanje.pretvoriUNizBajtova(upload.getSlika());
        } catch (IOException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        novoPredavanje.setFajl(fajl);
        novoPredavanje.setSlika(slika);

        Kompanija komp = null;
        for (Kompanija k : listaKompanija) {
            if (k.getId() == idKompanije) {
                komp = k;
                break;
            }
        }
        novoPredavanje.setKompanija(komp);
        
        novoPredavanje.setPredavac(novoPredavanje.getPredavac() + " (" + komp.getNaziv() + ")");
        
        pretvoriPrazneStringoveUNull();

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(novoPredavanje);

        session.getTransaction().commit();
        session.close();

        novoPredavanje = new Predavanje();
        datum = null;
        vreme = null;

        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("predavanjeUspesnoDodato"), ""));
    }
    
    private void pretvoriPrazneStringoveUNull() {   // samo za neobavezna polja
        if (novoPredavanje.getNaslov_en() != null && novoPredavanje.getNaslov_en().equals("")) {
            novoPredavanje.setNaslov_en(null);
        }
        if (novoPredavanje.getOpis_en() != null && novoPredavanje.getOpis_en().equals("")) {
            novoPredavanje.setOpis_en(null);
        }
        if (novoPredavanje.getBiografija() != null && novoPredavanje.getBiografija().equals("")) {
            novoPredavanje.setBiografija(null);
        }
    }

    public Predavanje getNovoPredavanje() {
        return novoPredavanje;
    }

    public void setNovoPredavanje(Predavanje novoPredavanje) {
        this.novoPredavanje = novoPredavanje;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

    public int getIdKompanije() {
        return idKompanije;
    }

    public void setIdKompanije(int idKompanije) {
        this.idKompanije = idKompanije;
    }

    public List<Kompanija> getListaKompanija() {
        return listaKompanija;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public Date getVreme() {
        return vreme;
    }

    public void setVreme(Date vreme) {
        this.vreme = vreme;
    }

}
