package de.c3d2.matemat.web.mobile;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.LineChartSeries;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

import de.c3d2.matemat.domain.Drink;
import de.c3d2.matemat.domain.Kasse;
import de.c3d2.matemat.domain.Transaction;
import de.c3d2.matemat.web.Logger;

@RooToString
@RooJavaBean
@ManagedBean
@ViewScoped
public class ProviderBean {

	
	/**
	 * Purchases
	 */
	private List<Purchase> purchases;
	private Float invoice;
	
	/**
	 * Corrections
	 */
	private Float newAmount;
	

	/**
	 * Statistics
	 * @return
	 */
    private CartesianChartModel chartModel;  
	
    public ProviderBean() {
    	chartModel = new CartesianChartModel();

		LineChartSeries series1 = new LineChartSeries();
		series1.setLabel("Kassenstand absolut");

		List<Transaction> list = Transaction.findAllTransactions(); 
		for (Transaction t : list) {
			series1.set(t.getD(), t.getAmount_after());
		}

		chartModel.addSeries(series1);
		
		initPurchases();

    }
    
    public void initPurchases() {
    	purchases = new ArrayList<Purchase>();
		for (Drink d : Drink.findAllDrinks()) {
			purchases.add(new Purchase(d));
		}

    }
    
	public Kasse getKasse() {
		return  Kasse.getKasse();
	}
	
	public void correct() {
		Kasse k = Kasse.getKasse();
		Transaction t = new Transaction(k);
		if (newAmount != null ) {
			t.setIo(newAmount - k.getAmount());
			k.setAmount(newAmount);
			t.setAmount_after(newAmount);
			k.merge();
			t.persist();
			Logger.info("Kasse", "Kasse enthält jetzt "+ k.getAmount());
			newAmount = null;
		}

	}
	
	public void checkout() {
		for (Purchase p : purchases) {
	        if (p.getEmptyBottles() != null)
	    		p.getDrink().removeEmptyBottles(p.getEmptyBottles());
			if (p.getFullBottles() != null)
	            p.getDrink().addBottles(p.getFullBottles());
			p.getDrink().merge();
		}
        if(invoice != null)
        {
    		Kasse.getKasse().auszahlung(invoice);
    		Logger.info("Kasse", "Kasse enthält "+ Kasse.getKasse().getAmount());

        }
		invoice = null;
		initPurchases();
	}

}
