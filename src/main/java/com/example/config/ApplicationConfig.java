package com.example.config;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.krazo.Properties;

@ApplicationScoped
@ApplicationPath("app")
public class ApplicationConfig extends Application {
    @Override
    public Map<String, Object> getProperties() {
        Map<String, Object> properties = new HashMap<>();
        properties.put(Properties.DEFAULT_VIEW_FILE_EXTENSION, "jsp");
        return properties;
    }
}