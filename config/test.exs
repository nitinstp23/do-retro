import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :do_retro, DoRetro.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "do_retro_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :do_retro, DoRetroWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4c5GzOtCWxoHNU0lDzSTmQb6ykAD58BocmvTkwjDpopNdK47CDQ5n/waEd6mKNME",
  server: false

# In test we don't send emails.
config :do_retro, DoRetro.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
