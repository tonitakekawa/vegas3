defmodule Vegas3.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :pass, :string

      timestamps()
    end

  end
end
