defmodule PersonalWikiWeb.Router do
  use PersonalWikiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PersonalWikiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PersonalWikiWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/wiki_pages", WikiPageLive.Index, :index
    live "/wiki_pages/new", WikiPageLive.Index, :new
    live "/wiki_pages/:id/edit", WikiPageLive.Index, :edit

    live "/wiki_pages/:id/show", WikiPageLive.Show, :show
    live "/wiki_pages/:id", WikiPageLive.Render, :render
    live "/wiki_pages/:id/show/edit", WikiPageLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", PersonalWikiWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PersonalWikiWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
