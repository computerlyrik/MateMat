package de.c3d2.matemat.web;
import de.c3d2.matemat.domain.Transaction;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Transaction.class, beanName = "transactionBean")
public class TransactionBean {
}
