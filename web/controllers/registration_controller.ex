defmodule Messenger.RegistrationController do
  use Messenger.Web, :controller

  def create(conn, %{"data" => %{"type" => "users",
                                 "attributes" => %{"email" => email,
                                                   "password" => password,
                                                   "password_confirmation" => password_confirmation}}}) do

    changeset = Messenger.User.changeset %Messenger.User{}, %{email: email,
                                          password_confirmation: password_confirmation,
                                          password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(Messenger.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Messenger.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
