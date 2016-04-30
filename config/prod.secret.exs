use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :messenger, Messenger.Endpoint,
  secret_key_base: "QoFx+yn6EYs22xOnCXkN/98N7wuvV7JpUzeLGYhwGiAkhs2I6cz3bPbVelsYQZRR"

# Configure your database
config :messenger, Messenger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "messenger_prod",
  pool_size: 20
