package beans;

import entityBeans.Kompanija;
import entityBeans.Korisnik;
import java.io.Serializable;
import java.util.ResourceBundle;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class DodajKompaniju implements Serializable {

    private Kompanija novaKompanija = new Kompanija();

    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;

    public void dodajKompaniju() {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpSession httpSession = (HttpSession) context.getExternalContext().getSession(false);
        Korisnik trenutniKorisnik = (Korisnik) httpSession.getAttribute("user");
        novaKompanija.getKontaktiFakultet().add(trenutniKorisnik);

        // POTREBNO JER JSF NE DOZVOLJAVA TEK TAKO DA KONVERTER VRATI NULL
//        pretvoriPrazneStringoveUNull();
        prazniStringoviUNull(novaKompanija);

        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(novaKompanija);

        session.getTransaction().commit();
        session.close();

        novaKompanija = new Kompanija();

        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("kompanijaUspesnoDodata"), ""));
    }

//    private void pretvoriPrazneStringoveUNull() {   // samo za neobavezna polja
//        if (novaKompanija.getTelefon2() != null && novaKompanija.getTelefon2().equals("")) {
//            novaKompanija.setTelefon2(null);
//        }
//        if (novaKompanija.getTelefon3() != null && novaKompanija.getTelefon3().equals("")) {
//            novaKompanija.setTelefon3(null);
//        }
//        if (novaKompanija.getTelefon4() != null && novaKompanija.getTelefon4().equals("")) {
//            novaKompanija.setTelefon4(null);
//        }
//        if (novaKompanija.getTelefon5() != null && novaKompanija.getTelefon5().equals("")) {
//            novaKompanija.setTelefon5(null);
//        }
//
//        if (novaKompanija.getEmail2() != null && novaKompanija.getEmail2().equals("")) {
//            novaKompanija.setEmail2(null);
//        }
//        if (novaKompanija.getEmail3() != null && novaKompanija.getEmail3().equals("")) {
//            novaKompanija.setEmail3(null);
//        }
//        if (novaKompanija.getEmail4() != null && novaKompanija.getEmail4().equals("")) {
//            novaKompanija.setEmail4(null);
//        }
//        if (novaKompanija.getEmail5() != null && novaKompanija.getEmail5().equals("")) {
//            novaKompanija.setEmail5(null);
//        }
//        
//        if (novaKompanija.getLogo() != null && novaKompanija.getLogo().equals("")) {
//            novaKompanija.setLogo(null);
//        }
//
//        if (novaKompanija.getOpis() != null && novaKompanija.getOpis().equals("")) {
//            novaKompanija.setOpis(null);
//        }
//    }
    
    public static void prazniStringoviUNull(Kompanija k) {
        if (k.getTelefon2() != null && k.getTelefon2().equals("")) {
            k.setTelefon2(null);
        }
        if (k.getTelefon3() != null && k.getTelefon3().equals("")) {
            k.setTelefon3(null);
        }
        if (k.getTelefon4() != null && k.getTelefon4().equals("")) {
            k.setTelefon4(null);
        }
        if (k.getTelefon5() != null && k.getTelefon5().equals("")) {
            k.setTelefon5(null);
        }

        if (k.getEmail2() != null && k.getEmail2().equals("")) {
            k.setEmail2(null);
        }
        if (k.getEmail3() != null && k.getEmail3().equals("")) {
            k.setEmail3(null);
        }
        if (k.getEmail4() != null && k.getEmail4().equals("")) {
            k.setEmail4(null);
        }
        if (k.getEmail5() != null && k.getEmail5().equals("")) {
            k.setEmail5(null);
        }
        
        if (k.getLogo() != null && k.getLogo().equals("")) {
            k.setLogo(null);
        }

        if (k.getOpis() != null && k.getOpis().equals("")) {
            k.setOpis(null);
        }
    }

    public Kompanija getNovaKompanija() {
        return novaKompanija;
    }

    public void setNovaKompanija(Kompanija novaKompanija) {
        this.novaKompanija = novaKompanija;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

}
