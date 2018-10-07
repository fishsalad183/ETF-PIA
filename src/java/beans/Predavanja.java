package beans;

import entityBeans.Predavanje;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Predavanja implements Serializable {
    private List<Predavanje> predavanja;
    
    private int brojacIspisanihArhiviranihPredavanja = 0;
    
    public void dohvatiPredavanja() {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();
        
        Criteria query = session.createCriteria(Predavanje.class);
        query.addOrder(Order.desc("datum")).addOrder(Order.desc("vreme"));
        predavanja = query.list();
        
        session.getTransaction().commit();
        session.close();
    }

    public List<Predavanje> getPredavanja() {
        return predavanja;
    }

    public void setPredavanja(List<Predavanje> predavanja) {
        this.predavanja = predavanja;
    }

    public int getBrojacIspisanihArhiviranihPredavanja() {
        return ++brojacIspisanihArhiviranihPredavanja;
    }

}
