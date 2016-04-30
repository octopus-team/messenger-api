use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :messenger, Messenger.Endpoint,
  secret_key_base: System.get_env("OCTOPUS_MESSENGER_API_SECRET_KEY_BASE")

# Configure your database
config :messenger, Messenger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DATABASE_USERNAME"),
  password: System.get_env("DATABASE_PASSWORD"),
  database: "messenger_prod",
  pool_size: 20
