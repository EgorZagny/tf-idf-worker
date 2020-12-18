defmodule TfIdfWorker.MixProject do
  use Mix.Project

  def project do
    [
      app: :tf_idf_worker,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TfIdfWorker.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 4.0"}
    ]
  end

  defp escript do
    [main_module: TfIdfWorker]
  end
end
