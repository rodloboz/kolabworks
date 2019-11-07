defmodule Kolab.Repo do
  use Ecto.Repo,
    otp_app: :kolab,
    adapter: Ecto.Adapters.Postgres
end
