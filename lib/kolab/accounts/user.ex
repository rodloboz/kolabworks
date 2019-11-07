defmodule Kolab.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :username}
  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :full_name, :string
    field :github, :string
    field :tagline, :string
    field :twitter, :string
    field :username, :string
    field :website, :string
    field :avatar, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :encrypted_password, :full_name, :tagline, :twitter, :github, :website])
    |> validate_required([:username, :email, :encrypted_password, :full_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_hashed_password
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/1)
    |> validate_format(:username, ~r/\A(?=.*[a-z])[a-z\d]+\Z/i)
  end

  defp put_hashed_password(changeset) do
    # require IEx; IEx.pry
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}}
        ->
          put_change(changeset, :encrypted_password, Bcrypt.hash_pwd_salt(password))
      _ ->
          changeset
    end
  end
end
