defmodule LiveViewExpo.Repo do
  use Ecto.Repo,
    otp_app: :live_view_expo,
    adapter: Ecto.Adapters.Postgres
end
