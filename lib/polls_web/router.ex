defmodule PollsWeb.Router do
  use PollsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PollsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PollsWeb do
    pipe_through :browser

    get "/", PageController, :home

  end

  scope "/polls", PollsWeb.Polls do
    pipe_through :browser

    get "/", PollsController, :list
    get "/:poll_id", PollsController, :detail
  end

  scope "/books", PollsWeb.Books do
    get "/", BookController, :list
  end

  scope "/admin", PollsWeb.Admin do
    pipe_through :browser
    get "/", HomeController, :home
  end

  scope "/api", PollsWeb.API do
    # TODO: How does adding pipe_through :api help
    # TODO: Add APIs for Polls and Books
    get "/", HomeController, :home
    post "/polls", HomeController, :create_poll
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:polls, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PollsWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
