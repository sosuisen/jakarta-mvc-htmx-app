<div class="todo-item">
    <input type="checkbox" ${todo.completed ? 'checked' : '' } hx-put="/app/api/todos/${todo.id}" hx-trigger="change">
    <span class="${todo.completed ? 'completed' : ''}">${todo.title}</span>
    <button hx-delete="/app/api/todos/${todo.id}" hx-target="closest .todo-item" hx-swap="outerHTML">Delete</button>
</div>