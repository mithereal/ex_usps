defmodule UspsEx.MixProject do
  use Mix.Project

  @version "2023.1.27"
  @source_url "https://github.com/mithereal/ex_usps"

  def project do
    [
      app: :usps_ex,
      version: @version,
      elixir: "~> 1.12",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: @source_url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp description do
    """
    A Feature Complete Usps api for elixir
    """
  end

  defp package do
    [
      name: :usps_ex,
      files: [
        "lib/usps_ex.ex",
        "lib/usps_ex",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Jason Clark"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:httpoison, ">= 0.0.0"},
      {:sweet_xml, ">= 0.0.0"},
      {:html_entities, ">= 0.0.0"},
      {:jason, "~> 1.2"},
      {:decimal, "~> 1.3"},
      {:iso, "~> 1.2"},
      {:csv, "~> 2.4", optional: true, only: [:dev]},
      {:nanoid, "~> 2.0"}
    ]
  end

  defp docs do
    [
    ]
  end
end
