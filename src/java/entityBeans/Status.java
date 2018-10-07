package entityBeans;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Status implements Serializable {
    public static final int PRIPREMLJEN = 1;
    public static final int POSLAT = 2;
    public static final int POTPISAN_F = 3;
    public static final int POTPISAN_K = 4;
    public static final int POTPISAN = 5;
    public static final int ARHIVIRAN = 6;
    
    @Id
    @Column
    private int id;
    
    @Column
    private String opis;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }
    
}
