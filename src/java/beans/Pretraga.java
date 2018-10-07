package beans;

import entityBeans.DonatorskiUgovor;
import entityBeans.Kompanija;
import entityBeans.NovcaniUgovor;
import entityBeans.Paket;
import entityBeans.Status;
import java.io.Serializable;
import java.util.ArrayList;
//import java.util.HashSet;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

@ManagedBean
@ViewScoped
public class Pretraga implements Serializable {

    private String paket = "";
    private String kompanija = "";
    private boolean samoAktuelne = false;

    private List<Kompanija> rezultati = null;

    public void pretrazi() {
        Paketi pa = new Paketi();
        pa.dohvatiPakete();
        List<Paket> paketi = pa.getPaketi();
        if (paket != null && !paket.equals("")) {
            paketi.removeIf((Paket p) -> !p.getNaziv().toLowerCase().contains(paket.toLowerCase()));
        }
        if (paketi.isEmpty()) {
            rezultati = null;
            return;
        }

        Kompanije ko = new Kompanije();
        ko.dohvatiKompanije();
        List<Kompanija> kompanije = ko.getKompanije();
        if (kompanija != null && !kompanija.equals("")) {
            kompanije.removeIf((Kompanija k) -> !k.getNaziv().toLowerCase().contains(kompanija.toLowerCase()));
        }
        if (kompanije.isEmpty()) {
            rezultati = null;
            return;
        }

        Ugovori ug = new Ugovori();
        ug.dohvatiUgovore();
        List<NovcaniUgovor> novcani = ug.getNovcaniUgovori();
        List<DonatorskiUgovor> donatorski = ug.getDonatorskiUgovori();

        // KORISTI SE ARRAYLIST UMESTO HASHSET ZBOG DOSLEDNOSTI U REDOSLEDU
//        HashSet<Kompanija> rez = new HashSet<>();
        rezultati = new ArrayList<>();

        for (Kompanija k : kompanije) {
            for (Paket p : paketi) {
                for (NovcaniUgovor u : novcani) {
                    if (p.getId() == u.getPaket().getId() && u.getKompanija().getId() == k.getId()) {
                        int statusId = u.getStatus().getId();
                        if (samoAktuelne) {
                            if (statusId == Status.POTPISAN) {
//                                rez.add(k);
                                dodajBezPonavljanja(rezultati, k);
                            }
                        } else {
                            if (statusId == Status.POTPISAN || statusId == Status.ARHIVIRAN) {
//                                rez.add(k);
                                dodajBezPonavljanja(rezultati, k);
                            }
                        }
                    }
                }
                for (DonatorskiUgovor u : donatorski) {
                    if (p.getId() == u.getPaket().getId() && u.getKompanija().getId() == k.getId()) {
                        int statusId = u.getStatus().getId();
                        if (samoAktuelne) {
                            if (statusId == Status.POTPISAN) {
//                                rez.add(k);
                                dodajBezPonavljanja(rezultati, k);
                            }
                        } else {
                            if (statusId == Status.POTPISAN || statusId == Status.ARHIVIRAN) {
//                                rez.add(k);
                                dodajBezPonavljanja(rezultati, k);
                            }
                        }
                    }
                }
            }
        }

//        rezultati = new ArrayList<>(rez);
    }

    private void dodajBezPonavljanja(List<Kompanija> lista, Kompanija k) {
        if (!lista.contains(k)) {
            lista.add(k);
        }
    }

    public String getPaket() {
        return paket;
    }

    public void setPaket(String paket) {
        this.paket = paket;
    }

    public String getKompanija() {
        return kompanija;
    }

    public void setKompanija(String kompanija) {
        this.kompanija = kompanija;
    }

    public boolean isSamoAktuelne() {
        return samoAktuelne;
    }

    public void setSamoAktuelne(boolean samoAktuelne) {
        this.samoAktuelne = samoAktuelne;
    }

    public List<Kompanija> getRezultati() {
        return rezultati;
    }

    public void setRezultati(List<Kompanija> rezultati) {
        this.rezultati = rezultati;
    }

}
