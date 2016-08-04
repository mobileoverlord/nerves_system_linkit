defmodule NervesSystemLinkit.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_linkit,
     version: @version,
     elixir: "~> 1.2",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description,
     package: package,
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]],
     deps: deps]
  end

  def application do
    []
  end

  defp deps do
    [#{:nerves, github: "nerves-project/nerves", branch: "pkg_gen", override: true},
     {:nerves, path: "/Users/jschneck/Developer/nerves/dev/nerves", override: true},
     {:nerves_system_br, github: "nerves-project/nerves_system_br", branch: "pkginfo"},
     #{:nerves_system_br, "~> 0.6.0"},
     #{:nerves_toolchain_mipsel_unknown_linux_musl, "~> 0.6.3"}]
     {:nerves_toolchain_mipsel_unknown_linux_musl, path: "../nerves_toolchain_mipsel_unknown_linux_musl"}]
  end

  defp description do
    """
    Nerves System - LinkIt Smart
    """
  end

  defp package do
    [maintainers: ["Frank Hunleth", "Justin Schneck"],
     files: ["rootfs-additions", "LICENSE", "mix.exs", "nerves_defconfig",
       "nerves.exs", "README.md", "VERSION", "rootfs-additions", "Config.in",
       "external.mk", "package", "post-createfs.sh", "fwup.conf", "linux-3.18.29"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/nerves_system_linkit"}]
  end
end
