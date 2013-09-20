package de.c3d2.matemat.web;
import de.c3d2.matemat.domain.Kasse;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Kasse.class, beanName = "kasseBean")
public class KasseBean {
}
