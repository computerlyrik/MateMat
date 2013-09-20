package de.c3d2.matemat.web;
import de.c3d2.matemat.domain.Hacker;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Hacker.class, beanName = "hackerBean")
public class HackerBean {
}
