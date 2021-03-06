// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Bottle;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Bottle_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Bottle.entityManager;
    
    public static final EntityManager Bottle.entityManager() {
        EntityManager em = new Bottle().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Bottle.countBottles() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Bottle o", Long.class).getSingleResult();
    }
    
    public static List<Bottle> Bottle.findAllBottles() {
        return entityManager().createQuery("SELECT o FROM Bottle o", Bottle.class).getResultList();
    }
    
    public static Bottle Bottle.findBottle(Long id) {
        if (id == null) return null;
        return entityManager().find(Bottle.class, id);
    }
    
    public static List<Bottle> Bottle.findBottleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Bottle o", Bottle.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Bottle.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Bottle.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Bottle attached = Bottle.findBottle(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Bottle.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Bottle.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Bottle Bottle.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Bottle merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
