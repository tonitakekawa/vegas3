defmodule Vegas3Web.LoginController do
  use Vegas3Web, :controller

  alias Vegas3.Account
  alias Vegas3.Account.Users

  action_fallback Vegas3Web.FallbackController

  def login(conn, %{"users" => users}) do

    email = users["email"]
    pass  = users["pass"]

    {result, id} = Account.exist?(email, pass)

    # TODO セッションにidを追加


    case result do
      :ok    -> render(conn, "succeed.json")
      :error -> render(conn, "error.json")
    end
  end
end
