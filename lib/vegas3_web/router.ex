defmodule Vegas3Web.Router do
  use Vegas3Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

#  scope "/", Vegas3Web do
#    pipe_through :browser # Use the default browser stack
#
##  end

  scope "/", Vegas3Web do
    pipe_through :api
    resources "/user", UsersController, except: [:new, :edit]
  end

  scope "/cointoss", Vegas3Web do
    pipe_through :api
    post      "/init"     , ApiController  , :init
    post      "/bet"      , ApiController  , :bet
    post      "/game"     , ApiController  , :game
    get       "/version"  , ApiController  , :version
  end

  # Other scopes may use custom stacks.
  # scope "/api", Vegas3Web do
  #   pipe_through :api
  # end
end