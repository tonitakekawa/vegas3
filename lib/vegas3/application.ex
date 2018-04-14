defmodule Vegas3.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Vegas3.Repo, []),
      supervisor(Vegas3Web.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Vegas3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Vegas3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
