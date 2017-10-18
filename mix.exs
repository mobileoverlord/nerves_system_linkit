defmodule NervesSystemLinkit.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.trim

  def project do
    [app: :nerves_system_linkit,
     version: @version,
     elixir: "~> 1.3",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
    []
  end

  defp deps do
    [
      {:nerves, "~> 0.7", runtime: false },
      {:nerves_system_br, "~> 0.14.0", runtime: false },
      {:nerves_toolchain_mipsel_unknown_linux_musl, "~> 0.11.0", runtime: false}
    ]
  end

  defp description do
    """
    Nerves System - LinkIt Smart
    """
  end

  defp package do
    [maintainers: ["Frank Hunleth", "Justin Schneck"],
     files: ["rootfs_overlay", "LICENSE", "mix.exs", "nerves_defconfig",
       "nerves.exs", "README.md", "VERSION", "rootfs_overlay", "Config.in",
       "external.mk", "package", "post-createfs.sh", "fwup.conf", "linux-4.4",
       "linux-backports.defconfig"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/nerves_system_linkit"}]
  end
end
