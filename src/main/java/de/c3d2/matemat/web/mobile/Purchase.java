package de.c3d2.matemat.web.mobile;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.domain.Drink;


@RooJavaBean
@RooToString
public class Purchase {

	private Drink drink;
	private Integer fullBottles;
	private Integer emptyBottles;
	
	public Purchase(Drink _drink){
		drink = _drink;
	}
}
