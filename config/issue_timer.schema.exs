@moduledoc """
A schema is a keyword list which represents how to map, transform, and validate
configuration values parsed from the .conf file. The following is an explanation of
each key in the schema definition in order of appearance, and how to use them.

## Import

A list of application names (as atoms), which represent apps to load modules from
which you can then reference in your schema definition. This is how you import your
own custom Validator/Transform modules, or general utility modules for use in
validator/transform functions in the schema. For example, if you have an application
`:foo` which contains a custom Transform module, you would add it to your schema like so:

`[ import: [:foo], ..., transforms: ["myapp.some.setting": MyApp.SomeTransform]]`

## Extends

A list of application names (as atoms), which contain schemas that you want to extend
with this schema. By extending a schema, you effectively re-use definitions in the
extended schema. You may also override definitions from the extended schema by redefining them
in the extending schema. You use `:extends` like so:

`[ extends: [:foo], ... ]`

## Mappings

Mappings define how to interpret settings in the .conf when they are translated to
runtime configuration. They also define how the .conf will be generated, things like
documention, @see references, example values, etc.

See the moduledoc for `Conform.Schema.Mapping` for more details.

## Transforms

Transforms are custom functions which are executed to build the value which will be
stored at the path defined by the key. Transforms have access to the current config
state via the `Conform.Conf` module, and can use that to build complex configuration
from a combination of other config values.

See the moduledoc for `Conform.Schema.Transform` for more details and examples.

## Validators

Validators are simple functions which take two arguments, the value to be validated,
and arguments provided to the validator (used only by custom validators). A validator
checks the value, and returns `:ok` if it is valid, `{:warn, message}` if it is valid,
but should be brought to the users attention, or `{:error, message}` if it is invalid.

See the moduledoc for `Conform.Schema.Validator` for more details and examples.
"""
[
  extends: [],
  import: [],
  mappings: [
    "sasl.errlog_type": [
      commented: false,
      datatype: :atom,
      default: :error
    ],
    "logger.console.format": [
      commented: false,
      datatype: :binary,
      default: """
      $time $metadata[$level] $message
      """,
      doc: "Provide documentation for logger.console.format here.",
      hidden: false,
      to: "logger.console.format"
    ],
    "logger.console.metadata": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        :request_id
      ],
      doc: "Provide documentation for logger.console.metadata here.",
      hidden: false,
      to: "logger.console.metadata"
    ],
    "logger.level": [
      commented: false,
      datatype: :atom,
      default: :info,
      doc: "Provide documentation for logger.level here.",
      hidden: false,
      to: "logger.level"
    ],
    "phoenix.serve_endpoints": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for phoenix.serve_endpoints here.",
      hidden: false,
      to: "phoenix.serve_endpoints"
    ],
    "issue_timer.ecto_repos": [
      commented: false,
      datatype: [
        list: :atom
      ],
      default: [
        IssueTimer.Repo
      ],
      doc: "Provide documentation for issue_timer.ecto_repos here.",
      hidden: false,
      to: "issue_timer.ecto_repos"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.secret_key_base": [
      commented: false,
      datatype: :binary,
      default: "gISRcLUhruXP2BjcWy76eRgKTjp5ag2RTU3e43ne7YKCgVBJZG8a6i3zdD0pA4we",
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.secret_key_base here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.secret_key_base"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.view": [
      commented: false,
      datatype: :atom,
      default: IssueTimerWeb.ErrorView,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.view here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.view"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.accepts": [
      commented: false,
      datatype: [
        list: :binary
      ],
      default: [
        "html",
        "json"
      ],
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.accepts here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.render_errors.accepts"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.name": [
      commented: false,
      datatype: :atom,
      default: IssueTimer.PubSub,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.name here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.name"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.adapter": [
      commented: false,
      datatype: :atom,
      default: Phoenix.PubSub.PG2,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.adapter here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.pubsub.adapter"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.load_from_system_env": [
      commented: false,
      datatype: :atom,
      default: true,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.load_from_system_env here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.load_from_system_env"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.url.host": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "HOST"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.url.host here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.url.host"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.url.port": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "PORT"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.url.port here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.url.port"
    ],
    "issue_timer.Elixir.IssueTimerWeb.Endpoint.cache_static_manifest": [
      commented: false,
      datatype: :binary,
      default: "priv/static/cache_manifest.json",
      doc: "Provide documentation for issue_timer.Elixir.IssueTimerWeb.Endpoint.cache_static_manifest here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimerWeb.Endpoint.cache_static_manifest"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.adapter": [
      commented: false,
      datatype: :atom,
      default: Ecto.Adapters.Postgres,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.adapter here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.adapter"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.username": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "DATABASE_USERNAME"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.username here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.username"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.password": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "DATABASE_PASSWORD"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.password here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.password"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.database": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "DATABASE_NAME"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.database here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.database"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.hostname": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "DATABASE_HOST"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.hostname here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.hostname"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.port": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "DATABASE_PORT"},
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.port here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.port"
    ],
    "issue_timer.Elixir.IssueTimer.Repo.pool_size": [
      commented: false,
      datatype: :integer,
      default: 10,
      doc: "Provide documentation for issue_timer.Elixir.IssueTimer.Repo.pool_size here.",
      hidden: false,
      to: "issue_timer.Elixir.IssueTimer.Repo.pool_size"
    ],
    "ueberauth.Elixir.Ueberauth.providers.github": [
      commented: false,
      datatype: {:atom, :binary},
      default: {Ueberauth.Strategy.Github, []},
      doc: "Provide documentation for ueberauth.Elixir.Ueberauth.providers.github here.",
      hidden: false,
      to: "ueberauth.Elixir.Ueberauth.providers.github"
    ],
    "ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_id": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "GITHUB_CLIENT_ID"},
      doc: "Provide documentation for ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_id here.",
      hidden: false,
      to: "ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_id"
    ],
    "ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_secret": [
      commented: false,
      datatype: {:atom, :binary},
      default: {:system, "GITHUB_CLIENT_SECRET"},
      doc: "Provide documentation for ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_secret here.",
      hidden: false,
      to: "ueberauth.Elixir.Ueberauth.Strategy.Github.OAuth.client_secret"
    ]
  ],
  transforms: [],
  validators: []
]
