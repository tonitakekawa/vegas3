defmodule Vegas3Web.UsersController do
  use Vegas3Web, :controller

  alias Vegas3.Account
  alias Vegas3.Account.Users

  action_fallback Vegas3Web.FallbackController

  def index(conn, _params) do
    user = Account.list_user()
    #IO.inspect user
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"users" => users_params}) do

    email = users_params["email"]

    isExist = Account.exist?(email)

    IO.inspect "isExist: #{isExist}"

    case isExist do

      :false ->     with {:ok, %Users{} = users} <- Account.create_users(users_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", users_path(conn, :show, users))
        |> render("show.json", users: users)
      end

      :true -> render("error.json", users: users_params)

    end


  end

  def show(conn, %{"id" => id}) do
    users = Account.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Account.get_users!(id)

    with {:ok, %Users{} = users} <- Account.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Account.get_users!(id)
    with {:ok, %Users{}} <- Account.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
