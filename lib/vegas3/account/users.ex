defmodule Vegas3.Account.Users do
  use     Ecto.Schema
  import  Ecto.Changeset

  schema "user" do
    field :email, :string
    field :pass,  :string

    timestamps()
  end

  def changeset(users, attrs) do
    users
    |> cast(attrs, [:email, :pass])
    |> validate_required([:email, :pass])
  end
end
