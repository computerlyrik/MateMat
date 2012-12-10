// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Kasse;
import de.c3d2.matemat.domain.KasseDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect KasseDataOnDemand_Roo_DataOnDemand {
    
    declare @type: KasseDataOnDemand: @Component;
    
    private Random KasseDataOnDemand.rnd = new SecureRandom();
    
    private List<Kasse> KasseDataOnDemand.data;
    
    public Kasse KasseDataOnDemand.getNewTransientKasse(int index) {
        Kasse obj = new Kasse();
        setAmount(obj, index);
        return obj;
    }
    
    public void KasseDataOnDemand.setAmount(Kasse obj, int index) {
        Float amount = new Integer(index).floatValue();
        if (amount > 9.9999999999E8F) {
            amount = 9.9999999999E8F;
        }
        obj.setAmount(amount);
    }
    
    public Kasse KasseDataOnDemand.getSpecificKasse(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Kasse obj = data.get(index);
        Long id = obj.getId();
        return Kasse.findKasse(id);
    }
    
    public Kasse KasseDataOnDemand.getRandomKasse() {
        init();
        Kasse obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Kasse.findKasse(id);
    }
    
    public boolean KasseDataOnDemand.modifyKasse(Kasse obj) {
        return false;
    }
    
    public void KasseDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Kasse.findKasseEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Kasse' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Kasse>();
        for (int i = 0; i < 10; i++) {
            Kasse obj = getNewTransientKasse(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
