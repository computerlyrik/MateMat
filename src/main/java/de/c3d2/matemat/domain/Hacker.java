package de.c3d2.matemat.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.exception.NoBottleException;
import de.c3d2.matemat.exception.NoFullBottleException;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findHackersByAmountLessThan", "findHackersByNameEquals" })
public class Hacker {

	/**
	 * Name des Hackers
	 */
    @NotNull
    @Column(unique = true)
    private String name;

    
    /**
     * Kontostand des Hackers
     */
    @Min(-10L)
    @Value("0")
    @Digits(integer = 9, fraction = 2)
    private Float amount;
    
    /**
     * Persönliche Pin zur authentifizierung
     */
    @NotNull
    @Value("0000")
    @Size(min = 4, max = 4)
    private String pin;
    
    /**
     * tells when the hacker did drink sth last time - sort criteria for intelligent list
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date lastDrink;
    
    public Hacker(String _name) {
    	name = _name;    	
    }
    
    
    public void trinkt(Drink g ) throws NoFullBottleException {
    	try {
        	Bottle b = g.getFilledBottle();
        	amount -= g.getPrice();
        	b.setFilled(false);
        	b.merge();
    	} catch (NoBottleException e) {
    		throw new NoFullBottleException();
    	}

    }
    
    public void zahlt_ein(float betrag) {
    	amount += betrag;
    	Kasse.getKasse().einzahlung(betrag);
    	System.out.println(name + " zahlt " + betrag + " ein");
    }
    
    
    public static List<Hacker> findHackersSortByLastDrink() {
        EntityManager em = Hacker.entityManager();
        TypedQuery<Hacker> q = em.createQuery("SELECT o FROM Hacker AS o ORDER BY lastDrink", Hacker.class);
        return q.getResultList();
    }
}
