
#正直、viewにするほどのことなのかなという気もする

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
    %{
      result:   :true,
      id:       users.id,
      email:    users.email,
      pass:     "********",
      inserted: users.inserted_at,
      updated:  users.updated_at,
      message: "正常にアカウントが作成されました"
    }
  end

  def render("error.json", _) do
    %{
      result:   :false,
      id:       "",
      email:    "",
      pass:     "",
      inserted: "",
      updated:  "",
      message: "アカウントは作成されませんでした"
    }
  end
end
