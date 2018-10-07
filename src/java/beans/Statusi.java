package beans;

import entityBeans.Status;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Statusi implements Serializable {
    private List<Status> statusi;
    
    public void dohvatiStatuse() {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();
        
        Criteria query = session.createCriteria(Status.class);
        statusi = query.list();
        
        session.getTransaction().commit();
        session.close();
    }

    public List<Status> getStatusi() {
        return statusi;
    }

    public void setStatusi(List<Status> statusi) {
        this.statusi = statusi;
    }
    
}
