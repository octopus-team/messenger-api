ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Messenger.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Messenger.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Messenger.Repo)

