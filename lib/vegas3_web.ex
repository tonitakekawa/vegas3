defmodule Vegas3Web do

  def controller do
    quote do
      use Phoenix.Controller, namespace: Vegas3Web
      import Plug.Conn
      import Vegas3Web.Router.Helpers
      import Vegas3Web.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/vegas3_web/templates",
                        namespace: Vegas3Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import Vegas3Web.Router.Helpers
      import Vegas3Web.ErrorHelpers
      import Vegas3Web.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import Vegas3Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
