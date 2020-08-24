defmodule ImaginationSquaresPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ImaginationSquaresPhoenix.Repo,
      # Start the Telemetry supervisor
      ImaginationSquaresPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ImaginationSquaresPhoenix.PubSub},
      # Start the Endpoint (http/https)
      ImaginationSquaresPhoenixWeb.Endpoint,
      Pow.Store.Backend.MnesiaCache
      # Start a worker by calling: ImaginationSquaresPhoenix.Worker.start_link(arg)
      # {ImaginationSquaresPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ImaginationSquaresPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ImaginationSquaresPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
