package beans;

import entityBeans.Stavka;
import java.io.Serializable;
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
public class Stavke implements Serializable {

    public List<Stavka> stavke;
    
    public void dohvatiStavke() {
        dohvatiStavke(false);
    }

    public void dohvatiStavke(boolean dohvatiIPakete) {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Stavka.class);
        stavke = query.list();

        if (dohvatiIPakete) {
            for (Stavka s : stavke) {
                Hibernate.initialize(s.getPaketi());
            }
        }

        session.getTransaction().commit();
        session.close();
    }

    public List<Stavka> getStavke() {
        return stavke;
    }

    public void setStavke(List<Stavka> stavke) {
        this.stavke = stavke;
    }

}
