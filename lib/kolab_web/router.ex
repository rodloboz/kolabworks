defmodule KolabWeb.Router do
  use KolabWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KolabWeb do
    pipe_through :browser

    get "/", IdeaController, :index
    resources "/ideas", IdeaController
  end

  # Other scopes may use custom stacks.
  # scope "/api", KolabWeb do
  #   pipe_through :api
  # end
end
