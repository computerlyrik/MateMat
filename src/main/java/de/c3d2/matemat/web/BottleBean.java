package de.c3d2.matemat.web;
import de.c3d2.matemat.domain.Bottle;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Bottle.class, beanName = "bottleBean")
public class BottleBean {
}
