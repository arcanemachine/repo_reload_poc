defmodule RepoReloadPoc.Repo do
  use Ecto.Repo,
    otp_app: :repo_reload_poc,
    adapter: Ecto.Adapters.Postgres
end
