defmodule Vegas3Web.PageController do
  use Vegas3Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
