// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Kasse;
import de.c3d2.matemat.domain.Transaction;
import java.util.Date;

privileged aspect Transaction_Roo_JavaBean {
    
    public Kasse Transaction.getKasse() {
        return this.kasse;
    }
    
    public void Transaction.setKasse(Kasse kasse) {
        this.kasse = kasse;
    }
    
    public Float Transaction.getIo() {
        return this.io;
    }
    
    public void Transaction.setIo(Float io) {
        this.io = io;
    }
    
    public Float Transaction.getAmount_after() {
        return this.amount_after;
    }
    
    public void Transaction.setAmount_after(Float amount_after) {
        this.amount_after = amount_after;
    }
    
    public Float Transaction.getAmount_before() {
        return this.amount_before;
    }
    
    public void Transaction.setAmount_before(Float amount_before) {
        this.amount_before = amount_before;
    }
    
    public Date Transaction.getD() {
        return this.d;
    }
    
    public void Transaction.setD(Date d) {
        this.d = d;
    }
    
}
