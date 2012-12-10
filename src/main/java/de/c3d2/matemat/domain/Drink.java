package de.c3d2.matemat.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.exception.NoBottleException;
import de.c3d2.matemat.web.Logger;

@RooJavaBean
@RooToString(excludeFields={"bottles"})
@RooJpaActiveRecord
public class Drink {

    @NotNull
    @Column(unique = true)
    private String name;

    @NotNull
    @Digits(integer = 1, fraction = 2)
    private Float price;

    @NotNull
    @Value("0.5")
    @Digits(integer = 1, fraction = 2)
    private Float bottleSize;
    
    @NotNull
    @Value("1")
    private Integer crateSize;
    
//    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "drink")
//    private Set<Bottle> bottles = new HashSet<Bottle>();
    
    public long getFilledCount() {
        EntityManager em = Bottle.entityManager();
        TypedQuery<Long> q = em.createQuery("SELECT COUNT(o) FROM Bottle AS o WHERE o.filled = true AND o.drink = :drink", Long.class);
        q.setParameter("drink", this);
        return q.getSingleResult();
    }
    
    public Bottle getFilledBottle() throws NoBottleException {
    	try {
	        EntityManager em = Bottle.entityManager();
	        TypedQuery<Bottle> q = em.createQuery("SELECT o FROM Bottle AS o WHERE o.filled = true AND o.drink = :drink", Bottle.class);
	        q.setParameter("drink", this);
	        return q.getResultList().get(0);
    	} catch (IndexOutOfBoundsException e) {
    		throw new NoBottleException();
	    }
    }
    
    public void addBottles(Integer count) {
    	Bottle b;
    	for (int i = 0; i < count; i++) {
    		b = new Bottle(this);
    		b.persist();
    	}
    }
    
    public void removeEmptyBottles(Integer count) {
    	try {
	        EntityManager em = Bottle.entityManager();
	        TypedQuery<Bottle> q = em.createQuery("SELECT o FROM Bottle AS o WHERE o.filled = false AND o.drink = :drink", Bottle.class);
	        q.setParameter("drink", this);
	        List<Bottle> bottles = q.getResultList();
	    	for (int i = 0; i < count; i++) {
	    		bottles.get(i).remove();
	    	}
    	}
    	catch (IndexOutOfBoundsException e) {
    		Logger.warn("Flaschen","No more empty bottles of "+name+" availible; empty bottles = 0");
    	}
    }
}
