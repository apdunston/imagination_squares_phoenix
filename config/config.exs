# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :imagination_squares_phoenix, :pow,
  user: ImaginationSquaresPhoenix.Users.User,
  repo: ImaginationSquaresPhoenix.Repo
  
config :imagination_squares_phoenix,
  ecto_repos: [ImaginationSquaresPhoenix.Repo]

# Configures the endpoint
config :imagination_squares_phoenix, ImaginationSquaresPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CPl4lS054sbirhdjOTiF8fxia3V665+voouj8S6/FaYEvulK4+wyRiYk+pdz5B0l",
  render_errors: [view: ImaginationSquaresPhoenixWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ImaginationSquaresPhoenix.PubSub,
  live_view: [signing_salt: "punQj8tj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
