// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Bottle;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Bottle_Roo_Jpa_Entity {
    
    declare @type: Bottle: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Bottle.id;
    
    @Version
    @Column(name = "version")
    private Integer Bottle.version;
    
    public Bottle.new() {
        super();
    }

    public Long Bottle.getId() {
        return this.id;
    }
    
    public void Bottle.setId(Long id) {
        this.id = id;
    }
    
    public Integer Bottle.getVersion() {
        return this.version;
    }
    
    public void Bottle.setVersion(Integer version) {
        this.version = version;
    }
    
}