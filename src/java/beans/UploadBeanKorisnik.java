package beans;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@ViewScoped
public class UploadBeanKorisnik implements Serializable {
    
    private boolean validationFailed;
    
    private byte[] fajl = null;
    
    private static boolean validateImageDimensions(byte[] bytes) throws IOException {
        // NE PODRZAVA TIFF - ISKORISTITI JAI BIBLIOTEKU
        BufferedImage bufferedImage = ImageIO.read(new ByteArrayInputStream(bytes));
        return bufferedImage.getHeight() <= 300 && bufferedImage.getWidth() <= 300;
    }
    
    public void fileUploadListener(FileUploadEvent event) throws IOException {
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
        validationFailed = !UploadBeanKorisnik.validateImageDimensions(fajl);

        if (validationFailed) {
            FacesContext context = FacesContext.getCurrentInstance();
            context.validationFailed();
            ((UIInput) event.getComponent()).setValid(false);
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Upload failed", "Dimenzije slike moraju biti do 300x300 piksela!");
            context.addMessage(event.getComponent().getClientId(), message);
            ((UIInput) event.getComponent()).resetValue();
            fajl = null;
        }
    }
    
//    public void validateDimensions(FacesContext context, UIComponent comp, Object value) {
//        System.out.print(validationFailed);
//        if (validationFailed) {
//            ((UIInput) comp).setValid(false);
//            System.out.print(comp);
//            context.validationFailed();
//            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Upload failed", "Dimenzije slike moraju biti do 300x300 piksela!");
//            context.addMessage(comp.getClientId(context), message);
//        }
//    }

    public byte[] getFajl() {
        return fajl;
    }
    
}
