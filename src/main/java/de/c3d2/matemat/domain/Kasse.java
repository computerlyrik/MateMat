package de.c3d2.matemat.domain;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.web.Logger;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Kasse {

    @Digits(integer = 9, fraction = 2)
    @Min(0L)
    private Float amount;
    
    public Kasse(float a) {
    	amount = a;
    }
    
    public void auszahlung(float betrag) {
    	try {
    		Transaction t = new Transaction(this);
    		
    		amount -= betrag;
    		t.setIo(-betrag);
    		t.setAmount_after(amount);
    		merge();
    		t.persist();
    		Logger.info("Kasse", "Kasse zahlt aus "+betrag+"; Neuer Kassenstand "+amount);

        	System.out.println();    	
    	}
    	catch (Exception e) {
    		Logger.error("Kasse", "You are not allowed to take "+betrag+" euros");

    	}

    }
    
    public void einzahlung(float betrag) {
    	Transaction t = new Transaction(this);
    	amount += betrag;
    	t.setIo(betrag);
    	t.setAmount_after(amount);
    	merge();
    	t.persist();
		Logger.info("Kasse", "Kasse erhält "+betrag+"; Neuer Kassenstand "+amount);
    }
    
    /**
     * Make it Singleton
     * @return
     */
    public static Kasse getKasse() {
    	if (Kasse.countKasses() == 0 ) {
    		Kasse k = new Kasse(0);
    		k.persist();
    		return k;
    	}
    	else return Kasse.findAllKasses().get(0);
    }
}
