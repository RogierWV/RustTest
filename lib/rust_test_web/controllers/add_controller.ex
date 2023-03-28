defmodule RustTestWeb.AddController do
  use RustTestWeb, :controller
  use Rustler, otp_app: :rust_test, crate: "rusttestweb_addcontroller"

  @spec add(integer, integer) :: integer
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, :add, result: add(1,2))
  end

  @spec call_add(Plug.Conn.t(), map) :: Plug.Conn.t()
  def call_add(conn, %{"first" => first, "second" => second} = _params) do
    render(conn, :add, result: add(String.to_integer(first), String.to_integer(second)))
  end
end
