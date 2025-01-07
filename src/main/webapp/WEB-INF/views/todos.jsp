<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Todo App</title>
        <script src="https://unpkg.com/htmx.org@1.9.10"></script>
        <style>
            .completed {
                text-decoration: line-through;
            }

            .todo-item {
                display: flex;
                align-items: center;
                gap: 10px;
                margin: 5px 0;
            }
        </style>
    </head>

    <body>
        <h1>Todo List</h1>

        <form hx-post="/app/api/todos" hx-target="#todo-list" hx-swap="beforeend">
            <input type="text" name="title" placeholder="New todo" required>
            <button type="submit">Add</button>
        </form>

        <div id="todo-list">
            <jsp:include page="todo-list.jsp" />
        </div>

        <script>
            htmx.on("htmx:afterRequest", function (evt) {
                if (evt.detail.successful) {
                    if (evt.detail.requestConfig.verb === "post") {
                        document.querySelector("form input[name='title']").value = "";
                    }
                }
            });
        </script>
    </body>

    </html>