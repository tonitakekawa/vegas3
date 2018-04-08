defmodule Vegas3Web.UsersView do
  use Vegas3Web, :view
  alias Vegas3Web.UsersView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      email: users.email,
      pass: users.pass}
  end
end
