defmodule Messenger.Router do
  use Messenger.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Messenger do
    pipe_through :api

    post "register", RegistrationController, :create

    post "token", SessionController, :create, as: :login
  end
end
