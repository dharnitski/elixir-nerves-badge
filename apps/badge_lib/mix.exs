defmodule BadgeLib.Mixfile do
  use Mix.Project

  def project do
    [app: :badge_lib,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :firmata, :oauth, :extwitter]]
  end

  defp deps do
    [{:firmata, github: "mobileoverlord/firmata"},
     {:oauth, github: "tim/erlang-oauth"},
     {:extwitter, "~> 0.6"}]
  end

end
