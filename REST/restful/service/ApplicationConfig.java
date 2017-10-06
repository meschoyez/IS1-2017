/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restful.service;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author lab6
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(restful.service.AutorFacadeREST.class);
        resources.add(restful.service.BibliotecarioFacadeREST.class);
        resources.add(restful.service.EjemplarFacadeREST.class);
        resources.add(restful.service.EstadoFacadeREST.class);
        resources.add(restful.service.LibroFacadeREST.class);
        resources.add(restful.service.PersonaFacadeREST.class);
        resources.add(restful.service.PrestamoFacadeREST.class);
        resources.add(restful.service.SocioFacadeREST.class);
    }
    
}
