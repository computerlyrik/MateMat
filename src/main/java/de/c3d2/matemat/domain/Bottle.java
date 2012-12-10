package de.c3d2.matemat.domain;

import javax.persistence.EntityManager;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Bottle {

    @NotNull
    @Value("true")
    private Boolean filled;

    @NotNull
    @ManyToOne
    private Drink drink;
   
    
    public Bottle(Drink d) {
    	drink = d;
    }
}
