// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Bottle;
import de.c3d2.matemat.domain.Drink;

privileged aspect Bottle_Roo_JavaBean {
    
    public Boolean Bottle.getFilled() {
        return this.filled;
    }
    
    public void Bottle.setFilled(Boolean filled) {
        this.filled = filled;
    }
    
    public Drink Bottle.getDrink() {
        return this.drink;
    }
    
    public void Bottle.setDrink(Drink drink) {
        this.drink = drink;
    }
    
}
