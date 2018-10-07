package beans;

import entityBeans.Korisnik;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Korisnici implements Serializable {

    private List<Korisnik> korisnici = null;
    private List<Korisnik> neodobreniKorisnici = null;
    private List<Korisnik> odobreniKorisnici = null;

    public void dohvatiKorisnike() {
        dohvatiKorisnike(false);
    }

    public void dohvatiKorisnike(boolean dohvatiIKompanijeKojePredstavlja) {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Korisnik.class);
        korisnici = query.list();

        if (dohvatiIKompanijeKojePredstavlja) {
            for (Korisnik k : korisnici) {
                Hibernate.initialize(k.getKompanijeKojePredstavlja());
            }
        }

        session.getTransaction().commit();
        session.close();
    }

    public void postaviNeodobreneKorisnike() {
        if (korisnici == null) {
            dohvatiKorisnike();
        }

        neodobreniKorisnici = new ArrayList<>();

        for (Korisnik k : korisnici) {
            if (k.getTip() == Korisnik.NEODOBREN) {
                neodobreniKorisnici.add(k);
            }
        }
    }
    
    public void postaviOdobreneKorisnike() {
        if (korisnici == null) {
            dohvatiKorisnike();
        }

        odobreniKorisnici = new ArrayList<>();

        for (Korisnik k : korisnici) {
            if (k.getTip() != Korisnik.NEODOBREN) {
                odobreniKorisnici.add(k);
            }
        }
    }

    public void odobri(String username) {
        Iterator<Korisnik> it = neodobreniKorisnici.iterator();
        while (it.hasNext()) {
            Korisnik k = it.next();
            if (k.getUsername().equals(username)) {
                k.setTip(Korisnik.CLAN);

                SessionFactory sessionF = HibernateUtil.getSessionFactory();
                Session session = sessionF.openSession();
                session.beginTransaction();

                session.update(k);

                session.getTransaction().commit();
                session.close();

                FacesContext context = FacesContext.getCurrentInstance();
                context.addMessage(null,
                        new FacesMessage(FacesMessage.SEVERITY_INFO, "Odobrena registracija korisnika sa korisničkim imenom: " + k.getUsername(), ""));

                it.remove();
                
                break;
            }
        }
    }

    public List<Korisnik> getKorisnici() {
        return korisnici;
    }

    public void setKorisnici(List<Korisnik> korisnici) {
        this.korisnici = korisnici;
    }

    public List<Korisnik> getNeodobreniKorisnici() {
        return neodobreniKorisnici;
    }

    public void setNeodobreniKorisnici(List<Korisnik> neodobreniKorisnici) {
        this.neodobreniKorisnici = neodobreniKorisnici;
    }

    public List<Korisnik> getOdobreniKorisnici() {
        return odobreniKorisnici;
    }

    public void setOdobreniKorisnici(List<Korisnik> odobreniKorisnici) {
        this.odobreniKorisnici = odobreniKorisnici;
    }
    
}
