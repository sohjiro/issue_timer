defmodule IssueTimerWeb.Router do
  use IssueTimerWeb, :router

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

  scope "/", IssueTimerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/profile", ProfileController, :profile
    get "/repo/:id", RepoController, :show
  end

  scope "/auth", IssueTimerWeb do
    pipe_through :browser # Use the default browser stack

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", IssueTimerWeb do
  #   pipe_through :api
  # end
end
