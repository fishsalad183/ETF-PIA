package beans;

import entityBeans.DonatorskiUgovor;
import entityBeans.Kompanija;
import entityBeans.Paket;
import entityBeans.Status;
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

@ManagedBean(name = "dUgo")
@ViewScoped
public class SklopiDonatorskiUgovor implements Serializable {
    
    DonatorskiUgovor noviUgovor = new DonatorskiUgovor();
    
    @ManagedProperty("#{poruke}")
    private ResourceBundle poruke;
    
    private final List<Kompanija> ponudjeneKompanije;
    private int idKompanije;
    
    private final List<Paket> ponudjeniPaketi;
    private int idPaketa;
    
    private final List<Status> ponudjeniStatusi;
    private int idStatusa;
    
    public SklopiDonatorskiUgovor() {
        Kompanije kompanije = new Kompanije();
        kompanije.dohvatiKompanije();
        ponudjeneKompanije = kompanije.getKompanije();
        
        Paketi paketi = new Paketi();
        paketi.dohvatiPakete();
        ponudjeniPaketi = paketi.getPaketi();
        
        Statusi statusi = new Statusi();
        statusi.dohvatiStatuse();
        ponudjeniStatusi = statusi.getStatusi();
    }
    
    public void sklopiUgovor() {
        Kompanija komp = null;
        for (Kompanija k : ponudjeneKompanije) {
            if (k.getId() == idKompanije) {
                komp = k;
                break;
            }
        }
        noviUgovor.setKompanija(komp);
        
        Paket paket = null;
        for (Paket p : ponudjeniPaketi) {
            if (p.getId() == idPaketa) {
                paket = p;
                break;
            }
        }
        noviUgovor.setPaket(paket);
        
        Status status = null;
        for (Status s : ponudjeniStatusi) {
            if (s.getId() == idStatusa) {
                status = s;
                break;
            }
        }
        noviUgovor.setStatus(status);
        
        pretvoriPrazneStringoveUNull();
        
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        session.persist(noviUgovor);

        session.getTransaction().commit();
        session.close();

        noviUgovor = new DonatorskiUgovor();

        FacesContext context = FacesContext.getCurrentInstance();
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, poruke.getString("sklapDUUspeh"), ""));
        
    }
    
    private void pretvoriPrazneStringoveUNull() {   // samo za neobavezna polja
        if (noviUgovor.getKomentar() != null && noviUgovor.getKomentar().equals("")) {
            noviUgovor.setKomentar(null);
        }
    }

    public DonatorskiUgovor getNoviUgovor() {
        return noviUgovor;
    }

    public void setNoviUgovor(DonatorskiUgovor noviUgovor) {
        this.noviUgovor = noviUgovor;
    }

    public ResourceBundle getPoruke() {
        return poruke;
    }

    public void setPoruke(ResourceBundle poruke) {
        this.poruke = poruke;
    }

    public int getIdKompanije() {
        return idKompanije;
    }

    public void setIdKompanije(int idKompanije) {
        this.idKompanije = idKompanije;
    }

    public int getIdPaketa() {
        return idPaketa;
    }

    public void setIdPaketa(int idPaketa) {
        this.idPaketa = idPaketa;
    }

    public int getIdStatusa() {
        return idStatusa;
    }

    public void setIdStatusa(int idStatusa) {
        this.idStatusa = idStatusa;
    }

    public List<Kompanija> getPonudjeneKompanije() {
        return ponudjeneKompanije;
    }

    public List<Paket> getPonudjeniPaketi() {
        return ponudjeniPaketi;
    }

    public List<Status> getPonudjeniStatusi() {
        return ponudjeniStatusi;
    }
    
}
