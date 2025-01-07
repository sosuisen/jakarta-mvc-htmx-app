<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <c:forEach var="todo" items="${todos}">
            <div class="todo-item">
                <input type="checkbox" ${todo.completed ? 'checked' : '' } hx-put="/app/todos/api/${todo.id}"
                    hx-trigger="change">
                <span class="${todo.completed ? 'completed' : ''}">${todo.title}</span>
                <button hx-delete="/app/todos/api/${todo.id}" hx-target="closest .todo-item"
                    hx-swap="outerHTML">Delete</button>
            </div>
        </c:forEach>
