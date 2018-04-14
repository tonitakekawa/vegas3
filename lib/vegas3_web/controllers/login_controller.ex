defmodule Vegas3Web.LoginController do
  use Vegas3Web, :controller

  alias Vegas3.Account
  alias Vegas3.Account.Users

  action_fallback Vegas3Web.FallbackController

  def login(conn, %{"users" => users}) do

    #users = Account.get_users!(id)
    render(conn, "show.json", users: users)

    #changeset = User.changeset(%User{}, user_params)

    #if valid?(changeset) do
    #  render conn, "index.html"
    #else
    #  render conn, "index.html"
    #end

  end

  def valid?(changeset) do
    :true
  #  Repo.get_by(User, email: String.downcase(changeset.changes.email))
  #  |> Comeonin.Bcrypt.check_pass(changeset.changes.password)
  end

end
