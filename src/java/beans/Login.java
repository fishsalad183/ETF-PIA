package beans;

import util.HibernateUtil;
import entityBeans.Korisnik;
import java.io.IOException;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import util.PasswordService;

@ManagedBean
@RequestScoped
public class Login {
    private String username;
    private String password;
    
//    private String poruka = "";
    
    private UIComponent component;

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UIComponent getComponent() {
        return component;
    }

    public void setComponent(UIComponent component) {
        this.component = component;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }
    
    public void login(){
        PasswordService ps = new PasswordService();
        String hashPass;
        try {
            hashPass = ps.encrypt(password);
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();
        
        Criteria query = session.createCriteria(Korisnik.class);
        Korisnik user = (Korisnik) query.add(Restrictions.eq("username", username)).add(Restrictions.eq("password", hashPass)).uniqueResult();
        if (user != null) Hibernate.initialize(user.getKompanijeKojePredstavlja());
        
        session.getTransaction().commit();
        session.close();
        
        if (user != null) {
            FacesContext fc = FacesContext.getCurrentInstance();
            String address;
            switch (user.getTip()) {
                case Korisnik.CLAN:
                    address = "clanPocetna.xhtml";
                    break;
                case Korisnik.IT_MENADZER:
                    address = "ITmenPocetna.xhtml";
                    break;
                case Korisnik.ADMIN:
                    address = "ITmenPocetna.xhtml"; // Nije definisano sta je adminu pocetna.
                    break;
                case Korisnik.NEODOBREN:
                    fc.addMessage(component.getClientId(),
                            new FacesMessage(FacesMessage.SEVERITY_ERROR, poruke.getString("korisnikNeodobren"), ""));
                    return;
                default:
                    fc.addMessage(component.getClientId(),
                            new FacesMessage(FacesMessage.SEVERITY_ERROR, "GREŠKA - LOGIN", ""));
                    return;
            }
            HttpSession hs = (HttpSession) fc.getExternalContext().getSession(false);
            hs.setAttribute("user", user);
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect(address);
            } catch (IOException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
            FacesContext.getCurrentInstance().responseComplete();
        }
        else {
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(component.getClientId(),
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, poruke.getString("korisnikNePostoji"), ""));
        }
    }
    
}
