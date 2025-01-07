package com.example.controller;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.View;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Response;
import jakarta.enterprise.context.RequestScoped;

import java.util.List;

import com.example.model.Todo;
import com.example.service.TodoService;

@Controller
@RequestScoped
@Path("todos")
public class TodoController {

    @Inject
    private TodoService todoService;

    @Inject
    private Models models;

    @GET
    @View("todos.jsp")
    public void index() {
        List<Todo> todos = todoService.getAllTodos();
        models.put("todos", todos);
    }

    @GET
    @Path("api")
    @View("empty.jsp")
    public void getTodo() {
    }

    @POST
    @Path("api")
    @View("todo-item.jsp")
    public void createTodo(@FormParam("title") String title) {
        Todo todo = new Todo();
        todo.setTitle(title);
        todo.setCompleted(false);
        todo = todoService.createTodo(todo);
        models.put("todo", todo);
    }

    @DELETE
    @Path("api/{id}")
    public Response deleteTodo(@PathParam("id") Long id) {
        todoService.deleteTodo(id);
        return Response.status(Response.Status.OK).build();
    }

    @PUT
    @Path("api/{id}")
    @View("todo-item.jsp")
    public void updateTodo(@PathParam("id") Long id) {
        Todo todo = todoService.getTodo(id);
        if (todo != null) {
            todo.setCompleted(!todo.isCompleted());
            todo = todoService.updateTodo(id, todo);
            models.put("todo", todo);
        }
    }
}