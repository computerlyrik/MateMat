// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Drink;
import de.c3d2.matemat.domain.DrinkDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect DrinkDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DrinkDataOnDemand: @Component;
    
    private Random DrinkDataOnDemand.rnd = new SecureRandom();
    
    private List<Drink> DrinkDataOnDemand.data;
    
    public Drink DrinkDataOnDemand.getNewTransientDrink(int index) {
        Drink obj = new Drink();
        setBottleSize(obj, index);
        setCrateSize(obj, index);
        setName(obj, index);
        setPrice(obj, index);
        return obj;
    }
    
    public void DrinkDataOnDemand.setBottleSize(Drink obj, int index) {
        Float bottleSize = new Integer(index).floatValue();
        if (bottleSize > 9.99F) {
            bottleSize = 9.99F;
        }
        obj.setBottleSize(bottleSize);
    }
    
    public void DrinkDataOnDemand.setCrateSize(Drink obj, int index) {
        Integer crateSize = new Integer(index);
        obj.setCrateSize(crateSize);
    }
    
    public void DrinkDataOnDemand.setName(Drink obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void DrinkDataOnDemand.setPrice(Drink obj, int index) {
        Float price = new Integer(index).floatValue();
        if (price > 9.99F) {
            price = 9.99F;
        }
        obj.setPrice(price);
    }
    
    public Drink DrinkDataOnDemand.getSpecificDrink(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Drink obj = data.get(index);
        Long id = obj.getId();
        return Drink.findDrink(id);
    }
    
    public Drink DrinkDataOnDemand.getRandomDrink() {
        init();
        Drink obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Drink.findDrink(id);
    }
    
    public boolean DrinkDataOnDemand.modifyDrink(Drink obj) {
        return false;
    }
    
    public void DrinkDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Drink.findDrinkEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Drink' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Drink>();
        for (int i = 0; i < 10; i++) {
            Drink obj = getNewTransientDrink(i);
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
