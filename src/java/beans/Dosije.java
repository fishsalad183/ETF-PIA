package beans;

import entityBeans.DonatorskiUgovor;
import entityBeans.Kompanija;
import entityBeans.NovcaniUgovor;
import entityBeans.Status;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import javax.faces.application.FacesMessage;
//import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Dosije implements Serializable {

//    private static final String KOMPANIJA_PARAMETAR = "kompanija";
//    private int idKompanije;
    private Kompanija kompanija;

    private List<UgovorElement> ugovori;
    
    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    public static final String NOVCANI = "Novčani";
    public static final String DONATORSKI = "Donatorski";
    public static final Date DANAS = new Date();

    public class UgovorElement implements Serializable {

        protected String tipUgovora;
        protected String vrstaPaketa;
        protected Date datumPotpisivanja;
        protected Date datumIsticanja;

        public boolean jeIstekao() {
            return DANAS.after(datumIsticanja);
        }

        public String getTipUgovora() {
            return tipUgovora;
        }

        public String getVrstaPaketa() {
            return vrstaPaketa;
        }

        public Date getDatumPotpisivanja() {
            return datumPotpisivanja;
        }

        public Date getDatumIsticanja() {
            return datumIsticanja;
        }
    }

//    private boolean izmene = false;
    public void dohvatiPodatke() {
        Map<String, String> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
        int idKompanije = Integer.parseInt(params.get("idKompanije"));

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Kompanija.class);
        kompanija = (Kompanija) query.add(Restrictions.eq("id", idKompanije)).uniqueResult();

        session.getTransaction().commit();
        session.close();

        Ugovori ug = new Ugovori();
        ug.dohvatiUgovore(true);
        List<NovcaniUgovor> novcani = ug.getNovcaniUgovori();
        List<DonatorskiUgovor> donatorski = ug.getDonatorskiUgovori();

        ugovori = new ArrayList<>();
        for (NovcaniUgovor n : novcani) {
            if (n.getKompanija().getId() == kompanija.getId()
                    && (n.getStatus().getId() == Status.POTPISAN || n.getStatus().getId() == Status.ARHIVIRAN)) {
                UgovorElement ugElem = new UgovorElement();
                ugElem.tipUgovora = NOVCANI;
                ugElem.vrstaPaketa = n.getPaket().getNaziv();
                ugElem.datumPotpisivanja = n.getDatum_ugovora();
                ugElem.datumIsticanja = DateBean.izracunajDatumIsteka(n.getDatum_ugovora(), n.getPaket().getTrajanje());
//                Date datIst = new Date(n.getDatum_ugovora().getYear() + n.getPaket().getTrajanje(), 
//                        n.getDatum_ugovora().getMonth(), n.getDatum_ugovora().getDate());
//                ugElem.datumIsticanja = datIst;
                ugovori.add(ugElem);
            }
        }
        for (DonatorskiUgovor d : donatorski) {
            if (d.getKompanija().getId() == kompanija.getId()
                    && (d.getStatus().getId() == Status.POTPISAN || d.getStatus().getId() == Status.ARHIVIRAN)) {
                UgovorElement ugElem = new UgovorElement();
                ugElem.tipUgovora = DONATORSKI;
                ugElem.vrstaPaketa = d.getPaket().getNaziv();
                ugElem.datumPotpisivanja = d.getDatum_ugovora();
                ugElem.datumIsticanja = DateBean.izracunajDatumIsteka(d.getDatum_ugovora(), d.getPaket().getTrajanje());
//                Date datIst = new Date(d.getDatum_ugovora().getYear() + d.getPaket().getTrajanje(), 
//                        d.getDatum_ugovora().getMonth(), d.getDatum_ugovora().getDate());
//                ugElem.datumIsticanja = datIst;
                ugovori.add(ugElem);
            }
        }
        
        ugovori.sort((o1, o2) -> {
            return -o1.datumIsticanja.compareTo(o2.datumIsticanja);
        });
    }

    public void sacuvajIzmene() {
        DodajKompaniju.prazniStringoviUNull(kompanija);
        
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.update(kompanija);
        
        session.getTransaction().commit();
        session.close();
        
        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("izmeneSacuvane"), ""));
    }

//    public String vidiDosije(Kompanija k) {
//        FacesContext.getCurrentInstance().getExternalContext().getFlash().put(KOMPANIJA_PARAMETAR, k);
//        return "dosije";
//    }
//    
//    @PostConstruct
//    private void init() {
//        kompanija = (Kompanija) FacesContext.getCurrentInstance().getExternalContext().getFlash().get(KOMPANIJA_PARAMETAR);
//    }
    public Kompanija getKompanija() {
        return kompanija;
    }

    public void setKompanija(Kompanija kompanija) {
        this.kompanija = kompanija;
    }

//    public int getIdKompanije() {
//        return idKompanije;
//    }
//
//    public void setIdKompanije(int idKompanije) {
//        this.idKompanije = idKompanije;
//    }
//    public boolean isIzmene() {
//        return izmene;
//    }
//
//    public void setIzmene(boolean izmene) {
//        this.izmene = izmene;
//    }

    public List<UgovorElement> getUgovori() {
        return ugovori;
    }

    public void setUgovori(List<UgovorElement> ugovori) {
        this.ugovori = ugovori;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }
    
}
