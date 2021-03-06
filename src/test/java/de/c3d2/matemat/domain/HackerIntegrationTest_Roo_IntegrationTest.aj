// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.domain;

import de.c3d2.matemat.domain.Hacker;
import de.c3d2.matemat.domain.HackerDataOnDemand;
import de.c3d2.matemat.domain.HackerIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HackerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: HackerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: HackerIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: HackerIntegrationTest: @Transactional;
    
    @Autowired
    private HackerDataOnDemand HackerIntegrationTest.dod;
    
    @Test
    public void HackerIntegrationTest.testCountHackers() {
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", dod.getRandomHacker());
        long count = Hacker.countHackers();
        Assert.assertTrue("Counter for 'Hacker' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void HackerIntegrationTest.testFindHacker() {
        Hacker obj = dod.getRandomHacker();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to provide an identifier", id);
        obj = Hacker.findHacker(id);
        Assert.assertNotNull("Find method for 'Hacker' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Hacker' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void HackerIntegrationTest.testFindAllHackers() {
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", dod.getRandomHacker());
        long count = Hacker.countHackers();
        Assert.assertTrue("Too expensive to perform a find all test for 'Hacker', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Hacker> result = Hacker.findAllHackers();
        Assert.assertNotNull("Find all method for 'Hacker' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Hacker' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void HackerIntegrationTest.testFindHackerEntries() {
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", dod.getRandomHacker());
        long count = Hacker.countHackers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Hacker> result = Hacker.findHackerEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Hacker' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Hacker' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void HackerIntegrationTest.testFlush() {
        Hacker obj = dod.getRandomHacker();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to provide an identifier", id);
        obj = Hacker.findHacker(id);
        Assert.assertNotNull("Find method for 'Hacker' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyHacker(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Hacker' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void HackerIntegrationTest.testMergeUpdate() {
        Hacker obj = dod.getRandomHacker();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to provide an identifier", id);
        obj = Hacker.findHacker(id);
        boolean modified =  dod.modifyHacker(obj);
        Integer currentVersion = obj.getVersion();
        Hacker merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Hacker' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void HackerIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", dod.getRandomHacker());
        Hacker obj = dod.getNewTransientHacker(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Hacker' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Hacker' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Hacker' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void HackerIntegrationTest.testRemove() {
        Hacker obj = dod.getRandomHacker();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Hacker' failed to provide an identifier", id);
        obj = Hacker.findHacker(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Hacker' with identifier '" + id + "'", Hacker.findHacker(id));
    }
    
}
