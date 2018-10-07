package beans;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

@ManagedBean
@ApplicationScoped
public class DateBean {
    
    public static final SimpleDateFormat SDF = new SimpleDateFormat("dd.MM.yyyy.");
    public static final SimpleDateFormat SDF_VREME = new SimpleDateFormat("HH:mm");
    
    public static java.util.Date dohvatiDanas() {
        return new java.util.Date();
    }
    
    public static boolean jeUBuducnosti(Date datum, Time vreme) {
        Date sada = new Date(System.currentTimeMillis());
        return sada.before(new Date(datum.getTime() + vreme.getTime()));
    }
    
    public static String pretvoriTimestampUDatumString(Timestamp timestamp) {
        return SDF.format(timestamp);
    }
    
    public static String pretvoriSQLDateUDatumString(Date date) {
        return SDF.format(date);
    }
    
    public static String pretvoriSQLTimeUVremeString(Time time) {
        return SDF_VREME.format(time);
    }
    
    public static String pretvoriJavaUtilDateUDatumString(java.util.Date date) {
        return SDF.format(date);
    }
    
    public static java.util.Date izracunajDatumIsteka(java.util.Date datumPotpisivanja, int trajanjeGodina) {
        return new java.util.Date(datumPotpisivanja.getYear() + trajanjeGodina, datumPotpisivanja.getMonth(), datumPotpisivanja.getDate());
    }
    
    
    
//    public static final SimpleDateFormat SDF_VREMENSKI_DIJAGRAM = new SimpleDateFormat("yyyy-MM-dd");
//    
//    public static String vremDijStr(java.util.Date date) {
//        return SDF_VREMENSKI_DIJAGRAM.format(date);
//    }
    
}
