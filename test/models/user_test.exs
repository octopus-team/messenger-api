defmodule Messenger.UserTest do
  use Messenger.ModelCase

  alias Messenger.User

  @valid_attrs %{
    email:                 "octo@pus.com",
    password:              "aebcd12345",
    password_confirmation: "aebcd12345"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                          password: "1lh2bj1rjbk2",
                                          password_confirmation: "b1bk23jkn12"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                          password: "1lh2bj1rjbk2"})
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
                                          password: "1lh2d",
                                          password_confirmation: "1lh2d"})
    refute changeset.valid?
  end
end
