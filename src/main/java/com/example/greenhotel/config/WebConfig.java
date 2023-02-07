package com.example.greenhotel.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String osName = System.getProperty("os.name");
        String userName = System.getProperty("user.name");
        if (osName.contains("Mac")) {
            registry.addResourceHandler("/room/**").addResourceLocations("file:///Users/"+ userName + "/Pictures/roomImg/");
        } else if (osName.contains("Windows")) {
            registry.addResourceHandler("/room/**").addResourceLocations("file:///C:/Users/"+ userName +"/Pictures/roomImg/");
        }

    }
}
