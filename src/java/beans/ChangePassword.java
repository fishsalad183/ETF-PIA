package beans;

import entityBeans.Korisnik;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;
//import javax.validation.constraints.AssertTrue;
import util.PasswordService;

@ManagedBean(name = "chgPass")
@RequestScoped
public class ChangePassword {

    private String username;
    private String oldPassword;
    private String newPassword;
//    private String confirmPassword;

    private UIComponent component;

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

//    @AssertTrue(message = "Nova i ponovljena šifra se razlikuju.")
//    public boolean isPasswordsEquals() {
//        return newPassword.equals(confirmPassword);
//    }
    public UIComponent getComponent() {
        return component;
    }

    public void setComponent(UIComponent component) {
        this.component = component;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

//    public String getConfirmPassword() {
//        return confirmPassword;
//    }
//
//    public void setConfirmPassword(String confirmPassword) {
//        this.confirmPassword = confirmPassword;
//    }
    public String changePassword() {
        PasswordService ps = new PasswordService();
        String hashOldPass;
        String hashNewPass;
        try {
            hashOldPass = ps.encrypt(oldPassword);
            hashNewPass = ps.encrypt(newPassword);
        } catch (Exception ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        Transaction tx = session.beginTransaction();

        String hqlUpdate = "update Korisnik set password = :noviPassword where username = :korIme and password = :stariPassword";
        int brIzmena = session.createQuery(hqlUpdate)
                .setString("noviPassword", hashNewPass)
                .setString("korIme", username)
                .setString("stariPassword", hashOldPass)
                .executeUpdate();
        tx.commit();
        session.close();

//        Criteria query = session.createCriteria(Korisnik.class);
//        Korisnik user = (Korisnik) query.add(Restrictions.eq("username", username)).add(Restrictions.eq("password", hashPass)).uniqueResult();
//        session.getTransaction().commit();

        FacesContext context = FacesContext.getCurrentInstance();
        if (brIzmena > 0) {
            context.addMessage(component.getClientId(),
                    new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("passwordUspesnoPromenjen"), ""));
            return "login";
        } else {
            context.addMessage(component.getClientId(),
                    new FacesMessage(FacesMessage.SEVERITY_ERROR, poruke.getString("passwordNeuspesnoPromenjen"), ""));
            context.validationFailed();
            return null;
        }
        
//        if (user != null) {
//            try {
//                user.setPassword(hashPass);
//                session.flush();
//                context.addMessage(component.getClientId(),
//                        new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("passwordUspesnoPromenjen"), ""));
//                return "login";
//            } catch (Exception e) {
//                if (session.getTransaction() != null) {
//                    session.getTransaction().rollback();
//                }
//                throw e;
//            } finally {
//                session.close();
//            }
//        } else {
////            context.addMessage(component.getClientId(), new FacesMessage(FacesMessage.SEVERITY_WARN, "", "Pogrešna šifra."));
//            context.validationFailed();
//            return null;
//        }
    }

}
