package com.example.controller;

import jakarta.mvc.Controller;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.enterprise.context.RequestScoped;

@Controller
@RequestScoped
@Path("hello")
public class HelloController {

    @GET
    public String hello() {
        return "hello.jsp";
    }
}