defmodule HiveWeb.PageController do
  use HiveWeb, :controller

  def index(conn, %{"name" => name}) do
    IO.puts("Old name: #{get_session(conn, :name)}")

    conn
    |> put_session(:name, name)
    |> redirect(to: "/")
  end
end
