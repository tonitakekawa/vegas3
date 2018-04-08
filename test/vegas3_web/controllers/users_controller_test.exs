defmodule Vegas3Web.UsersControllerTest do
  use Vegas3Web.ConnCase

  alias Vegas3.Account
  alias Vegas3.Account.Users

  @create_attrs %{email: "some email", pass: "some pass"}
  @update_attrs %{email: "some updated email", pass: "some updated pass"}
  @invalid_attrs %{email: nil, pass: nil}

  def fixture(:users) do
    {:ok, users} = Account.create_users(@create_attrs)
    users
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user", %{conn: conn} do
      conn = get conn, users_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create users" do
    test "renders users when data is valid", %{conn: conn} do
      conn = post conn, users_path(conn, :create), users: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, users_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "email" => "some email",
        "pass" => "some pass"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, users_path(conn, :create), users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update users" do
    setup [:create_users]

    test "renders users when data is valid", %{conn: conn, users: %Users{id: id} = users} do
      conn = put conn, users_path(conn, :update, users), users: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, users_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "email" => "some updated email",
        "pass" => "some updated pass"}
    end

    test "renders errors when data is invalid", %{conn: conn, users: users} do
      conn = put conn, users_path(conn, :update, users), users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete users" do
    setup [:create_users]

    test "deletes chosen users", %{conn: conn, users: users} do
      conn = delete conn, users_path(conn, :delete, users)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, users_path(conn, :show, users)
      end
    end
  end

  defp create_users(_) do
    users = fixture(:users)
    {:ok, users: users}
  end
end
