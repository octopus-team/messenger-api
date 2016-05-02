defmodule Messenger.UserController do
  use Messenger.Web, :controller

  alias Messenger.User
  plug Guardian.Plug.EnsureAuthenticated, handler: Messenger.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(Messenger.UserView, "show.json", user: user)
  end
  end
