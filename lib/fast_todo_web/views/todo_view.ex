defmodule FastTodoWeb.TodoView do
  use FastTodoWeb, :view
  alias FastTodoWeb.TodoView

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      body: todo.body,
      date: todo.date,
      done: todo.done}
  end
end
