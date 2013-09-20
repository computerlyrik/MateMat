// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.web;

import de.c3d2.matemat.domain.Bottle;
import de.c3d2.matemat.domain.Drink;
import de.c3d2.matemat.web.BottleBean;
import de.c3d2.matemat.web.converter.DrinkConverter;
import de.c3d2.matemat.web.util.MessageFactory;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.message.Message;
import org.primefaces.component.outputlabel.OutputLabel;
import org.primefaces.component.selectbooleancheckbox.SelectBooleanCheckbox;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect BottleBean_Roo_ManagedBean {
    
    declare @type: BottleBean: @ManagedBean(name = "bottleBean");
    
    declare @type: BottleBean: @SessionScoped;
    
    private String BottleBean.name = "Bottles";
    
    private Bottle BottleBean.bottle;
    
    private List<Bottle> BottleBean.allBottles;
    
    private boolean BottleBean.dataVisible = false;
    
    private List<String> BottleBean.columns;
    
    private HtmlPanelGrid BottleBean.createPanelGrid;
    
    private HtmlPanelGrid BottleBean.editPanelGrid;
    
    private HtmlPanelGrid BottleBean.viewPanelGrid;
    
    private boolean BottleBean.createDialogVisible = false;
    
    @PostConstruct
    public void BottleBean.init() {
        columns = new ArrayList<String>();
    }
    
    public String BottleBean.getName() {
        return name;
    }
    
    public List<String> BottleBean.getColumns() {
        return columns;
    }
    
    public List<Bottle> BottleBean.getAllBottles() {
        return allBottles;
    }
    
    public void BottleBean.setAllBottles(List<Bottle> allBottles) {
        this.allBottles = allBottles;
    }
    
    public String BottleBean.findAllBottles() {
        allBottles = Bottle.findAllBottles();
        dataVisible = !allBottles.isEmpty();
        return null;
    }
    
    public boolean BottleBean.isDataVisible() {
        return dataVisible;
    }
    
    public void BottleBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid BottleBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void BottleBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid BottleBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void BottleBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid BottleBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void BottleBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid BottleBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel filledCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        filledCreateOutput.setFor("filledCreateInput");
        filledCreateOutput.setId("filledCreateOutput");
        filledCreateOutput.setValue("Filled:");
        htmlPanelGrid.getChildren().add(filledCreateOutput);
        
        SelectBooleanCheckbox filledCreateInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        filledCreateInput.setId("filledCreateInput");
        filledCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.filled}", Boolean.class));
        filledCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(filledCreateInput);
        
        Message filledCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        filledCreateInputMessage.setId("filledCreateInputMessage");
        filledCreateInputMessage.setFor("filledCreateInput");
        filledCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(filledCreateInputMessage);
        
        OutputLabel drinkCreateOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        drinkCreateOutput.setFor("drinkCreateInput");
        drinkCreateOutput.setId("drinkCreateOutput");
        drinkCreateOutput.setValue("Drink:");
        htmlPanelGrid.getChildren().add(drinkCreateOutput);
        
        AutoComplete drinkCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        drinkCreateInput.setId("drinkCreateInput");
        drinkCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.drink}", Drink.class));
        drinkCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{bottleBean.completeDrink}", List.class, new Class[] { String.class }));
        drinkCreateInput.setDropdown(true);
        drinkCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "drink", String.class));
        drinkCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{drink.name} #{drink.price} #{drink.bottleSize} #{drink.crateSize}", String.class));
        drinkCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{drink}", Drink.class));
        drinkCreateInput.setConverter(new DrinkConverter());
        drinkCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(drinkCreateInput);
        
        Message drinkCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        drinkCreateInputMessage.setId("drinkCreateInputMessage");
        drinkCreateInputMessage.setFor("drinkCreateInput");
        drinkCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(drinkCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid BottleBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        OutputLabel filledEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        filledEditOutput.setFor("filledEditInput");
        filledEditOutput.setId("filledEditOutput");
        filledEditOutput.setValue("Filled:");
        htmlPanelGrid.getChildren().add(filledEditOutput);
        
        SelectBooleanCheckbox filledEditInput = (SelectBooleanCheckbox) application.createComponent(SelectBooleanCheckbox.COMPONENT_TYPE);
        filledEditInput.setId("filledEditInput");
        filledEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.filled}", Boolean.class));
        filledEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(filledEditInput);
        
        Message filledEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        filledEditInputMessage.setId("filledEditInputMessage");
        filledEditInputMessage.setFor("filledEditInput");
        filledEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(filledEditInputMessage);
        
        OutputLabel drinkEditOutput = (OutputLabel) application.createComponent(OutputLabel.COMPONENT_TYPE);
        drinkEditOutput.setFor("drinkEditInput");
        drinkEditOutput.setId("drinkEditOutput");
        drinkEditOutput.setValue("Drink:");
        htmlPanelGrid.getChildren().add(drinkEditOutput);
        
        AutoComplete drinkEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        drinkEditInput.setId("drinkEditInput");
        drinkEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.drink}", Drink.class));
        drinkEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{bottleBean.completeDrink}", List.class, new Class[] { String.class }));
        drinkEditInput.setDropdown(true);
        drinkEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "drink", String.class));
        drinkEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{drink.name} #{drink.price} #{drink.bottleSize} #{drink.crateSize}", String.class));
        drinkEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{drink}", Drink.class));
        drinkEditInput.setConverter(new DrinkConverter());
        drinkEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(drinkEditInput);
        
        Message drinkEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        drinkEditInputMessage.setId("drinkEditInputMessage");
        drinkEditInputMessage.setFor("drinkEditInput");
        drinkEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(drinkEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid BottleBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        javax.faces.application.Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText filledLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        filledLabel.setId("filledLabel");
        filledLabel.setValue("Filled:");
        htmlPanelGrid.getChildren().add(filledLabel);
        
        HtmlOutputText filledValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        filledValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.filled}", String.class));
        htmlPanelGrid.getChildren().add(filledValue);
        
        HtmlOutputText drinkLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        drinkLabel.setId("drinkLabel");
        drinkLabel.setValue("Drink:");
        htmlPanelGrid.getChildren().add(drinkLabel);
        
        HtmlOutputText drinkValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        drinkValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{bottleBean.bottle.drink}", Drink.class));
        drinkValue.setConverter(new DrinkConverter());
        htmlPanelGrid.getChildren().add(drinkValue);
        
        return htmlPanelGrid;
    }
    
    public Bottle BottleBean.getBottle() {
        if (bottle == null) {
            bottle = new Bottle();
        }
        return bottle;
    }
    
    public void BottleBean.setBottle(Bottle bottle) {
        this.bottle = bottle;
    }
    
    public List<Drink> BottleBean.completeDrink(String query) {
        List<Drink> suggestions = new ArrayList<Drink>();
        for (Drink drink : Drink.findAllDrinks()) {
            String drinkStr = String.valueOf(drink.getName() +  " "  + drink.getPrice() +  " "  + drink.getBottleSize() +  " "  + drink.getCrateSize());
            if (drinkStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(drink);
            }
        }
        return suggestions;
    }
    
    public String BottleBean.onEdit() {
        return null;
    }
    
    public boolean BottleBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void BottleBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String BottleBean.displayList() {
        createDialogVisible = false;
        findAllBottles();
        return "bottle";
    }
    
    public String BottleBean.displayCreateDialog() {
        bottle = new Bottle();
        createDialogVisible = true;
        return "bottle";
    }
    
    public String BottleBean.persist() {
        String message = "";
        if (bottle.getId() != null) {
            bottle.merge();
            message = "message_successfully_updated";
        } else {
            bottle.persist();
            message = "message_successfully_created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialogWidget.hide()");
        context.execute("editDialogWidget.hide()");
        
        FacesMessage facesMessage = MessageFactory.getMessage(message, "Bottle");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllBottles();
    }
    
    public String BottleBean.delete() {
        bottle.remove();
        FacesMessage facesMessage = MessageFactory.getMessage("message_successfully_deleted", "Bottle");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllBottles();
    }
    
    public void BottleBean.reset() {
        bottle = null;
        createDialogVisible = false;
    }
    
    public void BottleBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
