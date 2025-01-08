<!DOCTYPE html>
<html>

<head>
    <title>Todo List</title>
    <script src="https://unpkg.com/htmx.org@1.9.10"></script>
    <style>
        .container {
            margin: 20px;
        }

        .todo-form {
            margin-bottom: 20px;
        }

        .todo-item {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .todo-title {
            margin: 0 10px;
            flex-grow: 1;
        }

        .todo-title.completed {
            text-decoration: line-through;
        }

        .delete-btn {
            background-color: #ff4444;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .checkbox {
            margin-right: 10px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Todo List</h1>

        <form class="todo-form" hx-post="/app/api/todos" hx-swap="afterend">
            <input type="text" name="title" placeholder="新しいTodoを入力" />
            <button type="submit">追加</button>
        </form>

        <#include "todo-list.ftl">
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