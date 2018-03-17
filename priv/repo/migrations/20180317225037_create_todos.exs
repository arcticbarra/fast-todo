defmodule FastTodo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :body, :string
      add :date, :naive_datetime
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
