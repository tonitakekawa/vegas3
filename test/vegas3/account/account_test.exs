defmodule Vegas3.AccountTest do
  use Vegas3.DataCase

  alias Vegas3.Account

  describe "user" do
    alias Vegas3.Account.Users

    @valid_attrs %{email: "some email", pass: "some pass"}
    @update_attrs %{email: "some updated email", pass: "some updated pass"}
    @invalid_attrs %{email: nil, pass: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_users()

      users
    end

    test "list_user/0 returns all user" do
      users = users_fixture()
      assert Account.list_user() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Account.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Account.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.pass == "some pass"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, users} = Account.update_users(users, @update_attrs)
      assert %Users{} = users
      assert users.email == "some updated email"
      assert users.pass == "some updated pass"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_users(users, @invalid_attrs)
      assert users == Account.get_users!(users.id)
    end

    #test "delete_users/1 deletes the users" do
    #  users = users_fixture()
    #  assert {:ok, %Users{}} = Account.delete_users(users)
    #  assert_raise Ecto.NoResultsError, fn -> Account.get_users!(users.id) end
    #end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Account.change_users(users)
    end
  end
end
