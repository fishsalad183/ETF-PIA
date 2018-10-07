package beans;

import entityBeans.DonatorskiUgovor;
import entityBeans.Kompanija;
import entityBeans.Korisnik;
import entityBeans.NovcaniUgovor;
import entityBeans.Status;
//import entityBeans.UKontaktu;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
//import java.util.LinkedHashSet;
import java.util.List;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

@ManagedBean
@ViewScoped
public class Kompanije implements Serializable {

    private List<Kompanija> kompanije;

//    private LinkedHashSet<Kompanija> kompanijePoPaketu = new LinkedHashSet<>();
    private List<Kompanija> kompanijePoPaketu;
    private int poslednjiIdPaketa = -1;
    private String pretraga = "";

    private List<Kompanija> kompanijeSaNajskorijimUgovorima = null;
    private List<Kompanija> kompanijeUgovoriUskoroIsticu = null;

//    @ManagedProperty(value = "#{ugovori}")
    private Ugovori ugovori;

//    private Kontakti kontakti = null;
    private List<KompanijaUgovorDatum> kompUgDatIsticu = null;
    private List<KompanijaUgovorDatum> kompUgDatIstekli = null;

    public Kompanije() {
        ugovori = new Ugovori();
        ugovori.dohvatiUgovore();
    }

//    public void dohvatiKompanije() {
//        SessionFactory sessionF = HibernateUtil.getSessionFactory();
//        Session session = sessionF.openSession();
//        session.beginTransaction();
//
//        Criteria query = session.createCriteria(Kompanija.class);
//        kompanije = query.list();
//
//        session.getTransaction().commit();
//        session.close();
//    }
    public void dohvatiKompanije() {
        dohvatiKompanije(false);
    }

    public void dohvatiKompanije(boolean dohvatiIKontakte) {
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();

        Criteria query = session.createCriteria(Kompanija.class);
        kompanije = query.list();

        if (dohvatiIKontakte) {
            for (Kompanija k : kompanije) {
                Hibernate.initialize(k.getKontaktiFakultet());
            }
        }

        session.getTransaction().commit();
        session.close();
    }

//    public LinkedHashSet<Kompanija> dohvatiKompanijePoPaketu(int idPaket) {
//        if (poslednjiIdPaketa != idPaket) {
//            kompanijePoPaketu = dohvatiIzBazeKompanijePoPaketu(idPaket);
//            poslednjiIdPaketa = idPaket;
//        }
//        return kompanijePoPaketu;
//    }
//    private LinkedHashSet<Kompanija> dohvatiIzBazeKompanijePoPaketu(int idPaket) {
//        if (kompanije == null) dohvatiKompanije();
//        
//        LinkedHashSet<Kompanija> ret = new LinkedHashSet<>();
//        LinkedHashSet<Kompanija> toRemove = new LinkedHashSet<>();
//        
//        ArrayList<NovcaniUgovor> novcani = (ArrayList) ugovori.getNovcaniUgovori();
//        ArrayList<DonatorskiUgovor> donatorski = (ArrayList) ugovori.getDonatorskiUgovori();
//        
//        for (NovcaniUgovor u: novcani) {
//            for (Kompanija k: kompanije) {
//                if (u.getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
//                    if (u.getPaket().getId() == idPaket)
//                        ret.add(k);
//                    else if (u.getPaket().getId() < idPaket)
//                        toRemove.add(k);
//                }
//            }
//        }
//        for (DonatorskiUgovor u: donatorski) {
//            for (Kompanija k: kompanije) {
//                if (u.getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
//                    if (u.getPaket().getId() == idPaket)
//                        ret.add(k);
//                    else if (u.getPaket().getId() < idPaket)
//                        toRemove.add(k);
//                }
//            }
//        }
//        
//        ret.removeAll(toRemove);
//        
//        return ret;
//    }
    public List<Kompanija> dohvatiKompanijePoPaketu(int idPaket) {
        if (poslednjiIdPaketa != idPaket) {
            kompanijePoPaketu = dohvatiIzBazeKompanijePoPaketu(idPaket);
            poslednjiIdPaketa = idPaket;
        }
        filtriraj();
        return kompanijePoPaketu;
    }

    private List<Kompanija> dohvatiIzBazeKompanijePoPaketu(int idPaket) {
        if (kompanije == null) {
            dohvatiKompanije();
        }

        ArrayList<Kompanija> ret = new ArrayList<>();
//        ArrayList<Kompanija> toRemove = new ArrayList<>();

//        ArrayList<NovcaniUgovor> novcani = (ArrayList) ugovori.getNovcaniUgovori();
        List<NovcaniUgovor> novcani = ugovori.getNovcaniUgovori();
//        ArrayList<DonatorskiUgovor> donatorski = (ArrayList) ugovori.getDonatorskiUgovori();
        List<DonatorskiUgovor> donatorski = ugovori.getDonatorskiUgovori();

        for (Kompanija k : kompanije) {
            for (NovcaniUgovor u : novcani) {
                if (u.getPaket().getId() == idPaket && u.getKompanija().getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
                    ret.add(k);
                }
            }
            for (DonatorskiUgovor u : donatorski) {
                if (u.getPaket().getId() == idPaket && u.getKompanija().getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
                    ret.add(k);
                }
            }
        }

//        for (NovcaniUgovor u: novcani) {
//            for (Kompanija k: kompanije) {
//                if (u.getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
//                    if (u.getPaket().getId() == idPaket)
//                        ret.add(k);
//                    else if (u.getPaket().getId() < idPaket)
//                        toRemove.add(k);
//                }
//            }
//        }
//        for (DonatorskiUgovor u: donatorski) {
//            for (Kompanija k: kompanije) {
//                if (u.getId() == k.getId() && u.getStatus().getId() == Status.POTPISAN) {
//                    if (u.getPaket().getId() == idPaket)
//                        ret.add(k);
//                    else if (u.getPaket().getId() < idPaket)
//                        toRemove.add(k);
//                }
//            }
//        }
//        
//        ret.removeAll(toRemove);
        return ret;
    }

    public void filtriraj() {
        kompanijePoPaketu.removeIf((Kompanija k) -> !k.getNaziv().toLowerCase().contains(pretraga.toLowerCase()));
    }

    public List<Kompanija> dohvatiKompanijeSaNajskorijimUgovorima() {
        if (kompanijeSaNajskorijimUgovorima == null) {
            postaviKompanijeSPotpisanimUgovorima();
        }
        return kompanijeSaNajskorijimUgovorima;
    }

    public List<Kompanija> dohvatiKompanijeUgovoriUskoroIsticu() {
        if (kompanijeUgovoriUskoroIsticu == null) {
            postaviKompanijeSPotpisanimUgovorima();
        }
        return kompanijeUgovoriUskoroIsticu;
    }

    public List<Kompanija> dohvatiNajskorijih5Potpisanih() {
        List<Kompanija> lista = dohvatiKompanijeSaNajskorijimUgovorima();
        int vel = lista.size();
        return lista.subList(0, 5 > vel ? vel : 5);
    }

    public List<Kompanija> dohvatiNajskorijih5Isticu() {
        List<Kompanija> lista = dohvatiKompanijeUgovoriUskoroIsticu();
        int vel = lista.size();
        return lista.subList(0, 5 > vel ? vel : 5);
    }

    public class KompanijaUgovorDatum {

        public Kompanija k;
        public NovcaniUgovor nu = null;
        public DonatorskiUgovor du = null;
        public Date d;

        public KompanijaUgovorDatum(Kompanija k, NovcaniUgovor nu, Date d) {
            this.k = k;
            this.nu = nu;
            this.d = d;
        }

        public KompanijaUgovorDatum(Kompanija k, DonatorskiUgovor du, Date d) {
            this.k = k;
            this.du = du;
            this.d = d;
        }
    }

    public void postaviKompanijeSPotpisanimUgovorima() {
        if (kompanije == null) {
            dohvatiKompanije();
        }

        ArrayList<KompanijaUgovorDatum> lista = new ArrayList<>();

        ArrayList<NovcaniUgovor> novcani = (ArrayList) ugovori.getNovcaniUgovori();
        ArrayList<DonatorskiUgovor> donatorski = (ArrayList) ugovori.getDonatorskiUgovori();

        for (Kompanija k : kompanije) {
            for (NovcaniUgovor n : novcani) {
                if (n.getKompanija().getId() == k.getId() && n.getStatus().getId() == Status.POTPISAN) {
                    lista.add(new KompanijaUgovorDatum(k, n, n.getDatum_ugovora()));
                }
            }
            for (DonatorskiUgovor d : donatorski) {
                if (d.getKompanija().getId() == k.getId() && d.getStatus().getId() == Status.POTPISAN) {
                    lista.add(new KompanijaUgovorDatum(k, d, d.getDatum_ugovora()));
                }
            }
        }

        lista.sort((o1, o2) -> {
            return -o1.d.compareTo(o2.d);
        });
        kompanijeSaNajskorijimUgovorima = new ArrayList();
        for (KompanijaUgovorDatum kud : lista) {
            kompanijeSaNajskorijimUgovorima.add(kud.k);
        }

        kompanijeUgovoriUskoroIsticu = new ArrayList();
        for (KompanijaUgovorDatum kud : lista) {
            kud.d = DateBean.izracunajDatumIsteka(kud.d, kud.du != null ? kud.du.getPaket().getTrajanje() : kud.nu.getPaket().getTrajanje());
//            Date datIst = new Date(kud.d.getYear() + (kud.du != null ? kud.du.getPaket().getTrajanje() : kud.nu.getPaket().getTrajanje()), 
//                        kud.d.getMonth(), kud.d.getDate());
//            kud.d = datIst;
        }
        lista.sort((o1, o2) -> {
            return o1.d.compareTo(o2.d);
        });
        kompUgDatIsticu = new ArrayList<>(lista);
        for (KompanijaUgovorDatum kud : lista) {
            kompanijeUgovoriUskoroIsticu.add(kud.k);
        }
    }

    public void postaviKompanijeSIsteklimNeobnovljenimUgovorima() {
        if (kompanije == null) {
            dohvatiKompanije();
        }

        kompUgDatIstekli = new ArrayList<>();

        ArrayList<NovcaniUgovor> novcani = (ArrayList) ugovori.getNovcaniUgovori();
        ArrayList<DonatorskiUgovor> donatorski = (ArrayList) ugovori.getDonatorskiUgovori();

        for (Kompanija k : kompanije) {
            for (NovcaniUgovor n : novcani) {
                if (n.getKompanija().getId() == k.getId() && n.getStatus().getId() == Status.ARHIVIRAN) {
                    kompUgDatIstekli.add(new KompanijaUgovorDatum(k, n, n.getDatum_ugovora()));
                }
            }
            for (DonatorskiUgovor d : donatorski) {
                if (d.getKompanija().getId() == k.getId() && d.getStatus().getId() == Status.ARHIVIRAN) {
                    kompUgDatIstekli.add(new KompanijaUgovorDatum(k, d, d.getDatum_ugovora()));
                }
            }
        }

        kompUgDatIstekli.removeIf((KompanijaUgovorDatum tek) -> {
            for (KompanijaUgovorDatum kud : kompUgDatIsticu) {
                if (tek.k.getId() == kud.k.getId()) {
                    return true;
                }
            }
            return false;
        });

        for (KompanijaUgovorDatum kud : kompUgDatIstekli) {
            kud.d = DateBean.izracunajDatumIsteka(kud.d, kud.du != null ? kud.du.getPaket().getTrajanje() : kud.nu.getPaket().getTrajanje());
        }

        kompUgDatIstekli.sort((o1, o2) -> {
            return -o1.d.compareTo(o2.d);
        });
    }
    
//    private void dodajBezPonavaljanja(List<KompanijaUgovorDatum> lista, KompanijaUgovorDatum kud) {
//        for (KompanijaUgovorDatum tek : lista) {
//            if (tek.k.getId() == kud.k.getId()) {
//                return;
//            }
//        }
//        lista.add(kud);
//    }

//    public boolean jePredstavnik(Korisnik kor, Kompanija kom) {
//        if (kontakti == null) {
//            kontakti = new Kontakti();
//            kontakti.dohvatiKontakte();
//        }
//        return kontakti.jePredstavnik(kor, kom);
//    }
    public boolean jePredstavnik(Korisnik kor, Kompanija kom) {
        for (Kompanija k : kor.getKompanijeKojePredstavlja()) {
            if (k.getId() == kom.getId()) {
                return true;
            }
        }
        return false;
    }

    public List<Kompanija> getKompanije() {
        return kompanije;
    }

    public void setKompanije(List<Kompanija> kompanije) {
        this.kompanije = kompanije;
    }

    public Ugovori getUgovori() {
        return ugovori;
    }

    public void setUgovori(Ugovori ugovori) {
        this.ugovori = ugovori;
    }

    public String getPretraga() {
        return pretraga;
    }

    public void setPretraga(String pretraga) {
        this.pretraga = pretraga;
    }

    public List<Kompanija> getKompanijeSaNajskorijimUgovorima() {
        return kompanijeSaNajskorijimUgovorima;
    }

    public List<Kompanija> getKompanijeUgovoriUskoroIsticu() {
        return kompanijeUgovoriUskoroIsticu;
    }

    public List<KompanijaUgovorDatum> getKompUgDatIsticu() {
        return kompUgDatIsticu;
    }

    public List<KompanijaUgovorDatum> getKompUgDatIstekli() {
        return kompUgDatIstekli;
    }

}
