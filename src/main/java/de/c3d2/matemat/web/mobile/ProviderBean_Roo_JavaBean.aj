// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.web.mobile;

import de.c3d2.matemat.web.mobile.ProviderBean;
import de.c3d2.matemat.web.mobile.Purchase;
import java.util.List;
import org.primefaces.model.chart.CartesianChartModel;

privileged aspect ProviderBean_Roo_JavaBean {
    
    public List<Purchase> ProviderBean.getPurchases() {
        return this.purchases;
    }
    
    public void ProviderBean.setPurchases(List<Purchase> purchases) {
        this.purchases = purchases;
    }
    
    public Float ProviderBean.getInvoice() {
        return this.invoice;
    }
    
    public void ProviderBean.setInvoice(Float invoice) {
        this.invoice = invoice;
    }
    
    public Float ProviderBean.getNewAmount() {
        return this.newAmount;
    }
    
    public void ProviderBean.setNewAmount(Float newAmount) {
        this.newAmount = newAmount;
    }
    
    public CartesianChartModel ProviderBean.getChartModel() {
        return this.chartModel;
    }
    
    public void ProviderBean.setChartModel(CartesianChartModel chartModel) {
        this.chartModel = chartModel;
    }
    
}
