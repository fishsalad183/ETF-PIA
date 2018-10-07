package beans;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class UploadBeanOglas implements Serializable {
    
    private byte[] fajl = null;
    
    public void handleFileUpload(FileUploadEvent event) throws IOException {
        UploadedFile uploadedFile = event.getFile();
        byte[] bytes = new byte[(int) uploadedFile.getSize()];
        
        InputStream is = uploadedFile.getInputstream();
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        while ((nRead = is.read(bytes, 0, bytes.length)) != -1) {
            buffer.write(bytes, 0, nRead);
        }
        
        buffer.flush();
        
        fajl = buffer.toByteArray();
    }

    public byte[] getFajl() {
        return fajl;
    }

    public void setFajl(byte[] fajl) {
        this.fajl = fajl;
    }
    
}
