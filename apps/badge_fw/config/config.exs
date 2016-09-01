# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :badge_fw, :wlan0,
  #ssid: "ElixirConf",
  ssid: "Nerves",
  key_mgmt: :"WPA-PSK",
  psk: "nervesnet"
  #psk: "elixir2016"

config :nerves_ntp, :ntpd, "/usr/sbin/ntpd"
config :nerves_ntp, :servers, [
    "0.pool.ntp.org",
    "1.pool.ntp.org",
    "2.pool.ntp.org",
    "3.pool.ntp.org"
]

config :badge_settings, :nerves_settings, %{
  settings_file: "/root/nerves_settings.txt",
  device_name: "My Awesome Device",
  application_password: System.get_env("BADGE_CONFIG_PASSWORD") || "nerves_rulz!"
}

config :badge_settings, BadgeSettings.Endpoint,
  url: [host: "0.0.0.0"],
  http: [port: 80],
  secret_key_base: "R02jL0Vi+tFH7YOecTua/oc0b2dETOQT8/Sg9dD56EDKqmd8jRAdqa0CyZ7tOFIt",
  render_errors: [view: BadgeSettings.ErrorView, accepts: ~w(html json)],
  server: true,
  pubsub: [name: BadgeSettings.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, level: :error

import_config "secret.exs"

#config :extwitter, :oauth, [
#   consumer_key: "key",
#   consumer_secret: "key",
#   access_token: "key",
#   access_token_secret: "key"
#]
