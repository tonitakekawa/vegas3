defmodule Vegas3Web.VersionController do
  use Vegas3Web, :controller

def version(conn, _params) do

  msg =
  %{
    expectedClientVersion:  "new-vegas-client-0.0.0-develop",
    serverVersion:          "new-vegas-server-0.0.0-develop"
  }

  json conn, msg
end

end
