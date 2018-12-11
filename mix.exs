defmodule ExFootball.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_football,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/thienlhh/ex_football",
      name: "ExFootball"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 4.0"}
    ]
  end

  defp description do
    "Elixir client for football-data.org"
  end

  defp package do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ex_football",
      maintainers: "Thien Le",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/thienlhh/ex_football"}
    ]
  end
end
