# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :messenger, Messenger.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "A6nPvc8vL/tlkEtr1o6YAf2hlPTY0pPP+Vw+58H+Qx1kJUDyJOCl+rpIkWrYuL++",
  render_errors: [accepts: ~w(json)],
  pubsub: [name: Messenger.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Messenger",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "amVG0OoEdCRTmm30Uv6rwXnhrIfLG7Ld/G9ad+CzQqn9xNhwCMTFBqgxCiRpRAU5",
  serializer: Messenger.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
