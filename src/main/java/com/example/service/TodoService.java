package com.example.service;

import jakarta.enterprise.context.ApplicationScoped;
import com.example.model.Todo;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

@ApplicationScoped
public class TodoService {
    private final ConcurrentHashMap<Long, Todo> todos = new ConcurrentHashMap<>();
    private final AtomicLong idGenerator = new AtomicLong();

    public List<Todo> getAllTodos() {
        return new ArrayList<>(todos.values());
    }

    public Todo getTodo(Long id) {
        return todos.get(id);
    }

    public Todo createTodo(Todo todo) {
        todo.setId(idGenerator.incrementAndGet());
        todos.put(todo.getId(), todo);
        return todo;
    }

    public Todo updateTodo(Long id, Todo todo) {
        if (todos.containsKey(id)) {
            todo.setId(id);
            todos.put(id, todo);
            return todo;
        }
        return null;
    }

    public boolean deleteTodo(Long id) {
        return todos.remove(id) != null;
    }
}