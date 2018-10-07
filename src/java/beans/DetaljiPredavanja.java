package beans;

import entityBeans.Predavanje;
import java.io.Serializable;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class DetaljiPredavanja implements Serializable {
    
    public final String PARAM_NAME = "idPredavanja";
    
    private Predavanje predavanje;
    
    @PostConstruct
    public void init() {
        Map<String, String> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
        int idPredavanja = Integer.parseInt(params.get(PARAM_NAME));

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Predavanje.class);
        predavanje = (Predavanje) query.add(Restrictions.eq("id", idPredavanja)).uniqueResult();

        session.getTransaction().commit();
        session.close();
    }

    public String getPARAM_NAME() {
        return PARAM_NAME;
    }

    public Predavanje getPredavanje() {
        return predavanje;
    }

    public void setPredavanje(Predavanje predavanje) {
        this.predavanje = predavanje;
    }
    
}
