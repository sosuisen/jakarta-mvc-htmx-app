<div class="todo-item" id="todo-${todo.id}">
    <input type="checkbox" <#if todo.completed>checked</#if> class="checkbox"
    hx-put="/app/api/todos/${todo.id}" hx-trigger="change" />

    <span class="todo-title<#if todo.completed> completed</#if>">${todo.title}</span>

    <button class="delete-btn" hx-delete="/app/api/todos/${todo.id}" hx-swap="outerHTML"
        hx-target="closest .todo-item">削除</button>
</div>