defmodule RustTest.Repo do
  use Ecto.Repo,
    otp_app: :rust_test,
    adapter: Ecto.Adapters.Postgres
end
