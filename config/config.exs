# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fast_todo,
  ecto_repos: [FastTodo.Repo]

# Configures the endpoint
config :fast_todo, FastTodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ner/HLnowAV9OdvCf5RfctHHyqmpLkDYIacvJIOCrflj9aYNcL15vTgpFCXoKm4a",
  render_errors: [view: FastTodoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FastTodo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
