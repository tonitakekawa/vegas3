defmodule Vegas3Web.LoginView do
  use Vegas3Web, :view
  alias Vegas3Web.LoginView

  def render("show.json", %{users: users}) do
    %{data: ""}
  end

end


