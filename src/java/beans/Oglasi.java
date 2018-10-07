package beans;

import entityBeans.Oglas;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Oglasi implements Serializable {

    private List<Oglas> oglasi;

    public void dohvatiOglase() {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Oglas.class);
        query.addOrder(Order.desc("datum_i_vreme_unosenja"));
        oglasi = query.list();

        for (Oglas o : oglasi) {
            Hibernate.initialize(o.getKompanija());
        }

        session.getTransaction().commit();
        session.close();
    }

    public List<Oglas> getOglasi() {
        return oglasi;
    }

    public void setOglasi(List<Oglas> oglasi) {
        this.oglasi = oglasi;
    }

}
