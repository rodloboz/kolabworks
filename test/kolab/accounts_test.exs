defmodule Kolab.AccountsTest do
  use Kolab.DataCase

  alias Kolab.Accounts

  describe "users" do
    alias Kolab.Accounts.User

    @valid_attrs %{
      email: "some email",
      encrypted_password: "some encrypted_password",
      full_name: "some full_name",
      github: "some github",
      tagline: "some tagline",
      twitter: "some twitter",
      username: "some username",
      website: "some website"
    }
    @update_attrs %{
      email: "some updated email",
      encrypted_password: "some updated encrypted_password",
      full_name: "some updated full_name",
      github: "some updated github",
      tagline: "some updated tagline",
      twitter: "some updated twitter",
      username: "some updated username",
      website: "some updated website"
    }
    @invalid_attrs %{
      email: nil,
      encrypted_password: nil,
      full_name: nil,
      github: nil,
      tagline: nil,
      twitter: nil,
      username: nil,
      website: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.encrypted_password == "some encrypted_password"
      assert user.full_name == "some full_name"
      assert user.github == "some github"
      assert user.tagline == "some tagline"
      assert user.twitter == "some twitter"
      assert user.username == "some username"
      assert user.website == "some website"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.full_name == "some updated full_name"
      assert user.github == "some updated github"
      assert user.tagline == "some updated tagline"
      assert user.twitter == "some updated twitter"
      assert user.username == "some updated username"
      assert user.website == "some updated website"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
