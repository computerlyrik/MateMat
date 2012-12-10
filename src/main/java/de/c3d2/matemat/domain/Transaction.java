package de.c3d2.matemat.domain;

import java.util.Date;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Transaction {
    
    @NotNull
    @ManyToOne
    private Kasse kasse;
    
    @NotNull
    private Float io;
    
    @NotNull
    private Float amount_after;
  
    private Float amount_before;
    
    /**
     * The date of the transaction
     */
    private Date d = new Date();
    
    public Transaction(Kasse _kasse) {
    	kasse=_kasse;
    	amount_before = _kasse.getAmount();
    }
}
