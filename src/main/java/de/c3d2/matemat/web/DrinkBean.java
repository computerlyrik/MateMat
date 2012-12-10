package de.c3d2.matemat.web;

import de.c3d2.matemat.domain.Drink;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Drink.class, beanName = "drinkBean")
public class DrinkBean {
}
