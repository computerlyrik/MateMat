// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Hacker;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Hacker_Roo_Finder {
    
    public static TypedQuery<Hacker> Hacker.findHackersByAmountLessThan(Float amount) {
        if (amount == null) throw new IllegalArgumentException("The amount argument is required");
        EntityManager em = Hacker.entityManager();
        TypedQuery<Hacker> q = em.createQuery("SELECT o FROM Hacker AS o WHERE o.amount < :amount", Hacker.class);
        q.setParameter("amount", amount);
        return q;
    }
    
    public static TypedQuery<Hacker> Hacker.findHackersByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = Hacker.entityManager();
        TypedQuery<Hacker> q = em.createQuery("SELECT o FROM Hacker AS o WHERE o.name = :name", Hacker.class);
        q.setParameter("name", name);
        return q;
    }
    
}
