defmodule Messenger.Router do
  use Messenger.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Messenger do
    pipe_through :api

    resources "session", SessionController, only: [:index]
  end
end
