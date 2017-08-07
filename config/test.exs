use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :issue_timer, IssueTimerWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :issue_timer, IssueTimer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "issue_timer_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
