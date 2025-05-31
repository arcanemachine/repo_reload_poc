import Config

config :repo_reload_poc, ecto_repos: [RepoReloadPoc.Repo]

config :repo_reload_poc, RepoReloadPoc.Repo,
  database: "repo_reload_poc",
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  hostname: System.get_env("POSTGRES_HOST", "localhost")

if custom_logger_level = System.get_env("LOGGER_LEVEL") do
  config :logger, level: String.to_existing_atom(custom_logger_level)
end
