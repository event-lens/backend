defmodule EventLens.Repo do
  use Ecto.Repo,
    otp_app: :event_lens,
    adapter: Ecto.Adapters.Postgres
end
