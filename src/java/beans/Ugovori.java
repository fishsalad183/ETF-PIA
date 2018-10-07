package beans;

import entityBeans.DonatorskiUgovor;
import entityBeans.Kompanija;
import entityBeans.NovcaniUgovor;
import entityBeans.Status;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Ugovori implements Serializable {

    private List<NovcaniUgovor> novcaniUgovori;
    private List<DonatorskiUgovor> donatorskiUgovori;

    public void dohvatiUgovore() {
        dohvatiUgovore(false);
    }

    public void dohvatiUgovore(boolean dohvatiIPakete) {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query1 = session.createCriteria(NovcaniUgovor.class);
        novcaniUgovori = query1.list();

        Criteria query2 = session.createCriteria(DonatorskiUgovor.class);
        donatorskiUgovori = query2.list();

        if (dohvatiIPakete) {
            for (NovcaniUgovor n : novcaniUgovori) {
                Hibernate.initialize(n.getPaket());
            }
            for (DonatorskiUgovor u : donatorskiUgovori) {
                Hibernate.initialize(u.getPaket());
            }
        }

        session.getTransaction().commit();
        session.close();
    }

    public List<Kompanija> dohvatiKompanijeSaAktivnimUgovorima() {
        ArrayList<Kompanija> ret = new ArrayList<>();
        for (NovcaniUgovor n : novcaniUgovori) {
            if (n.getStatus().getId() == Status.POTPISAN) {
                dodajBezPonavljanja(ret, n.getKompanija());
            }
        }
        for (DonatorskiUgovor d : donatorskiUgovori) {
            if (d.getStatus().getId() == Status.POTPISAN) {
                dodajBezPonavljanja(ret, d.getKompanija());
            }
        }
        return ret;
    }

    private void dodajBezPonavljanja(List<Kompanija> lista, Kompanija k) {
        if (!lista.contains(k)) {
            lista.add(k);
        }
    }

    public List<NovcaniUgovor> getNovcaniUgovori() {
        return novcaniUgovori;
    }

    public void setNovcaniUgovori(List<NovcaniUgovor> novcaniUgovori) {
        this.novcaniUgovori = novcaniUgovori;
    }

    public List<DonatorskiUgovor> getDonatorskiUgovori() {
        return donatorskiUgovori;
    }

    public void setDonatorskiUgovori(List<DonatorskiUgovor> donatorskiUgovori) {
        this.donatorskiUgovori = donatorskiUgovori;
    }

}
