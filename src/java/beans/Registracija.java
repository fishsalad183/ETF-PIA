package beans;

import entityBeans.Korisnik;
import java.io.Serializable;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;
import util.PasswordService;

@ManagedBean(name = "reg")
@ViewScoped
public class Registracija implements Serializable {

    Korisnik noviKorisnik = new Korisnik();
    
    private UIComponent component;

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    private boolean vecPostoji() {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Korisnik.class);
        Korisnik user = (Korisnik) query.add(Restrictions.eq("username", noviKorisnik.getUsername())).uniqueResult();

        session.getTransaction().commit();
        session.close();

        return user != null;
    }

    public void registrujSe(UploadBeanKorisnik upload) {
        if (vecPostoji()) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(component.getClientId(), new FacesMessage(FacesMessage.SEVERITY_ERROR, poruke.getString("registracijaVecPostoji"), ""));
            ((UIInput) component).setValid(false);
            return;
        }

        noviKorisnik.setTip(Korisnik.NEODOBREN);

        PasswordService ps = new PasswordService();
        String hashPass;
        try {
            hashPass = ps.encrypt(noviKorisnik.getPassword());
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        noviKorisnik.setPassword(hashPass);

        noviKorisnik.setSlika(upload.getFajl());

        pretvoriPrazneStringoveUNull();

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(noviKorisnik);

        session.getTransaction().commit();
        session.close();

        noviKorisnik = new Korisnik();

        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("registracijaUspeh"), ""));
    }

    private void pretvoriPrazneStringoveUNull() {   // samo za neobavezna polja
        if (noviKorisnik.getLinkedin() != null && noviKorisnik.getLinkedin().equals("")) {
            noviKorisnik.setLinkedin(null);
        }
    }

    public Korisnik getNoviKorisnik() {
        return noviKorisnik;
    }

    public void setNoviKorisnik(Korisnik noviKorisnik) {
        this.noviKorisnik = noviKorisnik;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

    public UIComponent getComponent() {
        return component;
    }

    public void setComponent(UIComponent component) {
        this.component = component;
    }
    
}
