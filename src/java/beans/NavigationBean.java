package beans;

import entityBeans.Korisnik;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

@ManagedBean(name = "navigation")
@RequestScoped
public class NavigationBean {
    
    public String getHomepage() {
        FacesContext context = FacesContext.getCurrentInstance();
        HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
        Korisnik currUser = (Korisnik) session.getAttribute("user");
        String address;
        switch (currUser.getTip()) {
            case 0:
                address = "clanPocetna";
                break;
            case 1:
                address = "ITmenPocetna";
                break;
            case 2:
                address = "adminPocetna";   // Da li je definisana adminPocetna?
                break;
            default:
                return null;
        }
        return address + "?faces-redirect=true";
    }
    
    public static String redirect(int type){
        return "";
    }
}
