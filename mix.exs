defmodule Exnomics.MixProject do
  use Mix.Project

  def project do
    [
      app: :exnomics,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Exnomics.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.2.1"},
      {:jason, "~> 1.0"},
      {:mix_test_watch, "~> 0.8", only: :dev}
    ]
  end
end
