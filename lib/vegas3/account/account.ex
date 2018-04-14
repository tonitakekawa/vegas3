defmodule Vegas3.Account do
  import Ecto.Query, warn: false
  alias  Vegas3.Repo
  alias  Vegas3.Account.Users

  def list_user do
    Repo.all(Users)
  end

  def get_users!(id), do: Repo.get!(Users, id)

  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  def update_users(%Users{} = users, attrs) do
    users
    |> Users.changeset(attrs)
    |> Repo.update()
  end

  def delete_users(%Users{} = users) do
    Repo.delete(users)
  end

  def change_users(%Users{} = users) do
    Users.changeset(users, %{})
  end

end
