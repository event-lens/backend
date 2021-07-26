defmodule EventLens.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EventLens.Repo,
      # Start the Telemetry supervisor
      EventLensWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EventLens.PubSub},
      # Start the Endpoint (http/https)
      EventLensWeb.Endpoint
      # Start a worker by calling: EventLens.Worker.start_link(arg)
      # {EventLens.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EventLens.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EventLensWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
