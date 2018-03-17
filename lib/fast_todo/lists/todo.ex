defmodule FastTodo.Lists.Todo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "todos" do
    field :body, :string
    field :date, :naive_datetime
    field :done, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:body, :date, :done])
    |> validate_required([:body, :date])
  end
end
