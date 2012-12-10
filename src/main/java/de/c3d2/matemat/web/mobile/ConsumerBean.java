package de.c3d2.matemat.web.mobile;

import java.util.Collections;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.domain.Drink;
import de.c3d2.matemat.domain.Hacker;
import de.c3d2.matemat.domain.Kasse;
import de.c3d2.matemat.exception.NoFullBottleException;
import de.c3d2.matemat.web.Logger;

@RooToString
@RooJavaBean
@ManagedBean
@ViewScoped
public class ConsumerBean {

	/**
	 * Context - Hacker wants a drink
	 */
	Hacker h;
	Drink drink;
	
	/**
	 * to pay in matekasse
	 */
	Float payment;
	
	/**
	 * Getting drinks - empty out; full in; cost
	 */
	Float invoice;
	Integer fillup_full;
	Integer fillup_empty;
	
	
	/**
	 * hacker creation
	 */
	String hnew;
	
	
	public ConsumerBean() {
		System.out.println("ConsumerBean constructed");
	}
	
	public List<Hacker> getHackers() {
		return Hacker.findHackersSortByLastDrink();
	}
	
	public List<Drink> getDrinks() {
		return Drink.findAllDrinks();
	}
	
	public String drinkIt() {
		try {
			h.trinkt(drink);
			h = h.merge();
			return "pm:drinks";
		}
		catch (NoFullBottleException e) {
			Logger.warn("Flaschen Leer?","No more full bottles of "+drink.getName()+" availible to be consumed by "+h.getName());
			return "pm:fillup";
		}
		catch (ConstraintViolationException e) {
			System.out.println(e.getMessage());
			Logger.warn("Geld Leer o_O","Kein Geld mehr auf deinem Konto!");
			return "pm:account";
		}

	}
	
	public void pay() {
		System.out.println(payment);
		h.zahlt_ein(payment);
		h = h.merge();
		payment=null;
	}
	
	public void fillup() {
        if (fillup_empty != null)
    		drink.removeEmptyBottles(fillup_empty);
        if(invoice != null)
    		Kasse.getKasse().auszahlung(invoice);
		if (fillup_full != null)
            drink.addBottles(fillup_full);
		drink = drink.merge();
		fillup_empty = null;
		fillup_full = null;
		invoice = null;
	}
	
	public void register() {
		Hacker ha = new Hacker(hnew);
		ha.persist();
		h = ha;
		hnew = null;
	}
}
