defmodule HiveWeb.Router do
  use HiveWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HiveWeb do
    pipe_through :browser

    get "/", PageController, :index
    live "/fun", FunLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", HiveWeb do
  #   pipe_through :api
  # end
end
