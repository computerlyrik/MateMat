// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Drink;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Drink_Roo_Jpa_Entity {
    
    declare @type: Drink: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Drink.id;
    
    @Version
    @Column(name = "version")
    private Integer Drink.version;
    
    public Long Drink.getId() {
        return this.id;
    }
    
    public void Drink.setId(Long id) {
        this.id = id;
    }
    
    public Integer Drink.getVersion() {
        return this.version;
    }
    
    public void Drink.setVersion(Integer version) {
        this.version = version;
    }
    
}