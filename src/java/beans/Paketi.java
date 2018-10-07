package beans;

import entityBeans.Paket;
import entityBeans.Stavka;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
//import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Paketi implements Serializable {
    private List<Paket> paketi;
    
//    private List<String> nazivi = new ArrayList<>();
//    private List<Double> vrednosti = new ArrayList<>();
    
//    private final List<Stavka> stavke = new ArrayList<>();
//    private int poslednjiIdPaketaZaStavke = -1;
    
    public void dohvatiPakete() {
        dohvatiPakete(false);
    }
    
    public void dohvatiPakete(boolean dohvatiIStavke) {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();
        
        Criteria query = session.createCriteria(Paket.class);
        paketi = query.list();
        
        if (dohvatiIStavke) {
            for (Paket p: paketi) {
                Hibernate.initialize(p.getStavke());
//                nazivi.add(p.getNaziv());
//                vrednosti.add(p.getVrednost());
            }
        }
        
        session.getTransaction().commit();
        session.close();
    }
    
    public List<Stavka> dohvatiStavke(int idPaket) {
        for (Paket p: paketi) {
            if (idPaket == p.getId()) {
                return new ArrayList(p.getStavke());
            }
        }
        return null;
    }
    
//    public List<Stavka> dohvatiStavke(int idPaket) {
//        if (idPaket != poslednjiIdPaketaZaStavke) {
//            postaviStavke(idPaket);
//        }
//        return stavke;
//    }
//    
//    @Transactional
//    private void postaviStavke(int idPaket) {
//        for (Paket p: paketi) {
//            if (idPaket == p.getId()) {
//                if (!Hibernate.isInitialized(p.getStavke())) {
//                    Hibernate.initialize(p.getStavke());
//                }
//                stavke.clear();
//                stavke.addAll(p.getStavke());
//                poslednjiIdPaketaZaStavke = idPaket;
//                break;
//            }
//        }
//    }

    public List<Paket> getPaketi() {
        return paketi;
    }

    public void setPaketi(List<Paket> paketi) {
        this.paketi = paketi;
    }

//    public List<String> getNazivi() {
//        return nazivi;
//    }
//
//    public List<Double> getVrednosti() {
//        return vrednosti;
//    }
//
//    public void setNazivi(List<String> nazivi) {
//        this.nazivi = nazivi;
//    }
//
//    public void setVrednosti(List<Double> vrednosti) {
//        this.vrednosti = vrednosti;
//    }
    
}
