// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Bottle;
import de.c3d2.matemat.domain.BottleDataOnDemand;
import de.c3d2.matemat.domain.BottleIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BottleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: BottleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: BottleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: BottleIntegrationTest: @Transactional;
    
    @Autowired
    private BottleDataOnDemand BottleIntegrationTest.dod;
    
    @Test
    public void BottleIntegrationTest.testCountBottles() {
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", dod.getRandomBottle());
        long count = Bottle.countBottles();
        Assert.assertTrue("Counter for 'Bottle' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void BottleIntegrationTest.testFindBottle() {
        Bottle obj = dod.getRandomBottle();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to provide an identifier", id);
        obj = Bottle.findBottle(id);
        Assert.assertNotNull("Find method for 'Bottle' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Bottle' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void BottleIntegrationTest.testFindAllBottles() {
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", dod.getRandomBottle());
        long count = Bottle.countBottles();
        Assert.assertTrue("Too expensive to perform a find all test for 'Bottle', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Bottle> result = Bottle.findAllBottles();
        Assert.assertNotNull("Find all method for 'Bottle' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Bottle' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void BottleIntegrationTest.testFindBottleEntries() {
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", dod.getRandomBottle());
        long count = Bottle.countBottles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Bottle> result = Bottle.findBottleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Bottle' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Bottle' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void BottleIntegrationTest.testFlush() {
        Bottle obj = dod.getRandomBottle();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to provide an identifier", id);
        obj = Bottle.findBottle(id);
        Assert.assertNotNull("Find method for 'Bottle' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyBottle(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Bottle' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void BottleIntegrationTest.testMergeUpdate() {
        Bottle obj = dod.getRandomBottle();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to provide an identifier", id);
        obj = Bottle.findBottle(id);
        boolean modified =  dod.modifyBottle(obj);
        Integer currentVersion = obj.getVersion();
        Bottle merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Bottle' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void BottleIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", dod.getRandomBottle());
        Bottle obj = dod.getNewTransientBottle(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Bottle' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Bottle' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Bottle' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void BottleIntegrationTest.testRemove() {
        Bottle obj = dod.getRandomBottle();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Bottle' failed to provide an identifier", id);
        obj = Bottle.findBottle(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Bottle' with identifier '" + id + "'", Bottle.findBottle(id));
    }
    
}
