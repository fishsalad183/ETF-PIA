package beans;

import entityBeans.Paket;
import entityBeans.Stavka;
import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class FormirajPaket implements Serializable {
    
    private Paket noviPaket = new Paket();
    
    private final List<Stavka> stavke;
    private String[] odabraneStavke;
    
    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;
    
    public FormirajPaket() {
        Stavke s = new Stavke();
        s.dohvatiStavke();
        stavke = s.getStavke();
    }
    
    public void formiraj() {
        for (String stringId : odabraneStavke) {
            final int id = Integer.parseInt(stringId);
            for (Stavka s : stavke) {
                if (s.getId() == id) {
                    noviPaket.getStavke().add(s);
                }
            }
        }
        
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(noviPaket);

        session.getTransaction().commit();
        session.close();

        noviPaket = new Paket();

        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("formiranjePaketaUspeh"), ""));
    }
    
    public Paket getNoviPaket() {
        return noviPaket;
    }

    public void setNoviPaket(Paket noviPaket) {
        this.noviPaket = noviPaket;
    }

    public List<Stavka> getStavke() {
        return stavke;
    }

    public String[] getOdabraneStavke() {
        return odabraneStavke;
    }

    public void setOdabraneStavke(String[] odabraneStavke) {
        this.odabraneStavke = odabraneStavke;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }
    
}
