defmodule FastTodo.ListsTest do
  use FastTodo.DataCase

  alias FastTodo.Lists

  describe "todos" do
    alias FastTodo.Lists.Todo

    @valid_attrs %{body: "some body", date: ~N[2010-04-17 14:00:00.000000], done: true}
    @update_attrs %{body: "some updated body", date: ~N[2011-05-18 15:01:01.000000], done: false}
    @invalid_attrs %{body: nil, date: nil, done: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Lists.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Lists.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Lists.create_todo(@valid_attrs)
      assert todo.body == "some body"
      assert todo.date == ~N[2010-04-17 14:00:00.000000]
      assert todo.done == true
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, todo} = Lists.update_todo(todo, @update_attrs)
      assert %Todo{} = todo
      assert todo.body == "some updated body"
      assert todo.date == ~N[2011-05-18 15:01:01.000000]
      assert todo.done == false
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_todo(todo, @invalid_attrs)
      assert todo == Lists.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Lists.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Lists.change_todo(todo)
    end
  end
end
