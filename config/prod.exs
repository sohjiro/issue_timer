use Mix.Config
config :issue_timer, IssueTimerWeb.Endpoint,
  load_from_system_env: true,
  url: [host: {:system, "HOST", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :phoenix, :serve_endpoints, true

import_config "prod.secret.exs"
