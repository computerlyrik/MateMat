package de.c3d2.matemat.web;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class Logger {

	public static void info(String header, String message) {
		FacesContext context = FacesContext.getCurrentInstance();
		//context.getExternalContext().getFlash().setKeepMessages(true);
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO,header, message));
	}
	public static void error(String header, String message) {
		FacesContext context = FacesContext.getCurrentInstance();
		//context.getExternalContext().getFlash().setKeepMessages(true);
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,header, message));
	}
	public static void warn(String header, String message) {
		FacesContext context = FacesContext.getCurrentInstance();
		//context.getExternalContext().getFlash().setKeepMessages(true);
        context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,header, message));
	}
}
