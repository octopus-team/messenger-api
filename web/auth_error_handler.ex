defmodule Messenger.AuthErrorHandler do
  use Messenger.Web, :controller

  def unauthenticated(conn, params) do
    conn
    |> put_status(401)
    |> render(Messenger.ErrorView, "401.json")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(403)
    |> render(Messenger.ErrorView, "403.json")
  end
end
