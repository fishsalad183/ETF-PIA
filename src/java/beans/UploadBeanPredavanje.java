package beans;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class UploadBeanPredavanje implements Serializable {
    
    private UploadedFile fajl = null;
    private UploadedFile slika = null;
    
    public static byte[] pretvoriUNizBajtova(UploadedFile uploadedFile) throws IOException {
        if (uploadedFile == null || uploadedFile.getSize() == 0) {
            return null;
        }
        
        byte[] bytes = new byte[(int) uploadedFile.getSize()];
        
        InputStream is = uploadedFile.getInputstream();
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        while ((nRead = is.read(bytes, 0, bytes.length)) != -1) {
            buffer.write(bytes, 0, nRead);
        }
        
        buffer.flush();
        
        return buffer.toByteArray();
    }

    public UploadedFile getFajl() {
        return fajl;
    }

    public void setFajl(UploadedFile fajl) {
        this.fajl = fajl;
    }

    public UploadedFile getSlika() {
        return slika;
    }

    public void setSlika(UploadedFile slika) {
        this.slika = slika;
    }
    
}
