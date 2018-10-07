package beans;

import entityBeans.Kompanija;
import entityBeans.Korisnik;
import entityBeans.Oglas;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;
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
public class DodajOglas implements Serializable {

    private Oglas noviOglas = new Oglas();

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    private final List<Kompanija> listaKompanija;
    private int idKompanije;
    private String[] ponude;

    public DodajOglas() {
        FacesContext fc = FacesContext.getCurrentInstance();
        HttpSession hs = (HttpSession) fc.getExternalContext().getSession(false);
        Korisnik korisnik = (Korisnik) hs.getAttribute("user");
        listaKompanija = new ArrayList<>(korisnik.getKompanijeKojePredstavlja());

        Ugovori ugovori = new Ugovori();
        ugovori.dohvatiUgovore();
        List<Kompanija> aktivne = ugovori.dohvatiKompanijeSaAktivnimUgovorima();

        DodajOglas.ukloniNeaktivne(listaKompanija, aktivne);
    }

    public static void ukloniNeaktivne(List<Kompanija> predstavljane, List<Kompanija> aktivne) {
        Iterator<Kompanija> it = predstavljane.iterator();
        ITERATOR_PETLJA:
        while (it.hasNext()) {
            Kompanija k = it.next();
            for (Kompanija aktivna : aktivne) {
                if (k.getId() == aktivna.getId()) {
                    continue ITERATOR_PETLJA;
                }
            }
            it.remove();
        }
    }

    public void dodajOglas(UploadBeanOglas upload) {
        for (String ponuda : ponude) {
            if (ponuda != null) {
                switch (ponuda) {
                    case "praksa":
                        noviOglas.setPraksa(true);
                        break;
                    case "zaposlenje":
                        noviOglas.setPosao(true);
                        break;
                }
            }
        }

        noviOglas.setDatum_i_vreme_unosenja(new Timestamp(System.currentTimeMillis()));

        noviOglas.setFajl(upload.getFajl());

        Kompanija komp = null;
        for (Kompanija k : listaKompanija) {
            if (k.getId() == idKompanije) {
                komp = k;
                break;
            }
        }
        noviOglas.setKompanija(komp);

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(noviOglas);

        session.getTransaction().commit();
        session.close();

        noviOglas = new Oglas();

        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("oglasUspesnoDodat"), ""));
    }

//    public List<Kompanija> dohvatiListuKompanija() {
//        FacesContext fc = FacesContext.getCurrentInstance();
//        HttpSession hs = (HttpSession) fc.getExternalContext().getSession(false);
//        Korisnik korisnik = (Korisnik) hs.getAttribute("user");
//        return new ArrayList<>(korisnik.getKompanijeKojePredstavlja());
//    }
    public Oglas getNoviOglas() {
        return noviOglas;
    }

    public void setNoviOglas(Oglas noviOglas) {
        this.noviOglas = noviOglas;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

    public String[] getPonude() {
        return ponude;
    }

    public void setPonude(String[] ponude) {
        this.ponude = ponude;
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

}
