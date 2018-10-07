package beans;

import entityBeans.Kompanija;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.primefaces.event.ItemSelectEvent;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.DateAxis;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;

@ManagedBean
@ViewScoped
public class VremenskiDijagram implements Serializable {

    private LineChartModel dateModel;

    private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
    final Date DANAS;
    final Date ZA_6_MESECI;
    final Date PRE_6_MESECI;

    private final List<Kompanije.KompanijaUgovorDatum> neistekli;
    private final List<Kompanija> komp20IsticuKroz6Meseci;
    private final List<Kompanije.KompanijaUgovorDatum> istekli;
    private final List<Kompanija> komp20IstekliUPrethodnih6Meseci;

    public VremenskiDijagram() {
        Kompanije kompanije = new Kompanije();
        kompanije.postaviKompanijeSPotpisanimUgovorima();
        neistekli = kompanije.getKompUgDatIsticu();
        kompanije.postaviKompanijeSIsteklimNeobnovljenimUgovorima();
        istekli = kompanije.getKompUgDatIstekli();

        DANAS = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(DANAS);
        cal.add(Calendar.DAY_OF_YEAR, 189); // 189 dana je tacno 27 sedmica (6 meseci, zaokruzeno nagore)
        ZA_6_MESECI = cal.getTime();
        cal.setTime(DANAS);
        cal.add(Calendar.DAY_OF_YEAR, -189);
        PRE_6_MESECI = cal.getTime();

        komp20IsticuKroz6Meseci = new ArrayList<>();
        int max = 20 > neistekli.size() ? neistekli.size() : 20;
        for (int i = 0; i < max; i++) {
            if (neistekli.get(i).d.before(ZA_6_MESECI)) {
                komp20IsticuKroz6Meseci.add(neistekli.get(i).k);
            }
        }

        komp20IstekliUPrethodnih6Meseci = new ArrayList<>();
        max = 20 > istekli.size() ? istekli.size() : 20;
        for (int i = 0; i < max; i++) {
            if (istekli.get(i).d.after(PRE_6_MESECI)) {
                komp20IstekliUPrethodnih6Meseci.add(istekli.get(i).k);
            }
        }
    }

    @PostConstruct
    public void init() {
        createModel();
    }

    public LineChartModel getDateModel() {
        return dateModel;
    }

    private void createModel() {
        dateModel = new LineChartModel();
        LineChartSeries series = new LineChartSeries();
        series.setShowLine(false);

        for (Kompanije.KompanijaUgovorDatum kud : neistekli) {
            if (kud.d.after(ZA_6_MESECI)) {
                break;
            }
            final double y = kud.du != null ? kud.du.getProc_vred() : kud.nu.getVrednost();
            series.set(SDF.format(kud.d), y);
        }

        dateModel.addSeries(series);

        dateModel.setTitle("Kompanije čiji ugovori ističu u narednih 6 meseci");
        dateModel.setZoom(false);
        dateModel.getAxis(AxisType.Y).setLabel("(Procenjena) vrednost ugovora");
        DateAxis axis = new DateAxis("Narednih 6 meseci");
        axis.setTickAngle(-50);
        axis.setMin(SDF.format(DANAS));
        axis.setMax(SDF.format(ZA_6_MESECI));
        axis.setTickFormat("%d.%m.%Y.");
//        axis.setTickCount(28);  // 27 sedmica + 1 jer se obelezava i pocetak dijagrama
        // ima neki problem u izracunavanju, obicno ukupno 2 datuma nisu tacno podesena na nedelju dana od prethodnog
        
        axis.setTickInterval("1 week"); // isto ima problem u izracunavanju, ali samo 1 datum nije u redu (?)

        dateModel.getAxes().put(AxisType.X, axis);
    }

    public void itemSelect(ItemSelectEvent event) {
        // sortiranost omogucava ovo
        final int index = event.getItemIndex();
        final int idKompanije = neistekli.get(index).k.getId();
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect("dosije.xhtml?idKompanije=" + idKompanije);
        } catch (IOException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Kompanija> getKomp20IsticuKroz6Meseci() {
        return komp20IsticuKroz6Meseci;
    }

    public List<Kompanija> getKomp20IstekliUPrethodnih6Meseci() {
        return komp20IstekliUPrethodnih6Meseci;
    }

}
