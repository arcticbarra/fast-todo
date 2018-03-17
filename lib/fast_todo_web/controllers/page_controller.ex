defmodule FastTodoWeb.PageController do
  use FastTodoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
