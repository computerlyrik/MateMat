// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.c3d2.matemat.web.converter;

import de.c3d2.matemat.domain.Hacker;
import de.c3d2.matemat.web.converter.HackerConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

privileged aspect HackerConverter_Roo_Converter {
    
    declare parents: HackerConverter implements Converter;
    
    declare @type: HackerConverter: @FacesConverter("de.c3d2.matemat.web.converter.HackerConverter");
    
    public Object HackerConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return Hacker.findHacker(id);
    }
    
    public String HackerConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Hacker ? ((Hacker) value).getId().toString() : "";
    }
    
}
