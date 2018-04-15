defmodule Vegas3Web.LoginView do
  use Vegas3Web, :view

  def render("succeed.json", _) do
    %{
      result:    :true,
      message:   "ログインしました"
    }
  end

  def render("error.json", _) do
    %{
      result:    :false,
      message:   "メールアドレスかパスワードが違います"
    }
  end

end


