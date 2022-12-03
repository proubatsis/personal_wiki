defmodule PersonalWiki.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PersonalWiki.Repo,
      # Start the Telemetry supervisor
      PersonalWikiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PersonalWiki.PubSub},
      # Start the Endpoint (http/https)
      PersonalWikiWeb.Endpoint
      # Start a worker by calling: PersonalWiki.Worker.start_link(arg)
      # {PersonalWiki.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalWiki.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PersonalWikiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
