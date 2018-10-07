package beans;

import java.io.File;
import java.io.InputStream;
import javax.faces.bean.ManagedBean;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import org.primefaces.model.StreamedContent;

@ManagedBean
public class FileDownloadView {
    /*
    private StreamedContent file;
    
    public void startDownload() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExternalContext externalContext = facesContext.getExternalContext();
        
        externalContext.responseReset();
        externalContext.getMimeType(file);
        externalContext.setResponseHeader("Content-Type", value);
        
        File file = new File("file");
        file.
        InputStream stream = externalContext.getResourceAsStream(path);
    }
*/
    
}
