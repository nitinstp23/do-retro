defmodule DoRetro.Repo do
  use Ecto.Repo,
    otp_app: :do_retro,
    adapter: Ecto.Adapters.Postgres
end
