defmodule NervesSystemLinkit.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_linkit,
     version: @version,
     elixir: "~> 1.2",
     compilers: Mix.compilers ++ [:nerves_system],
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves_system, "~> 0.1.4"},
     {:nerves_system_br, "~> 0.7.0"},
     {:nerves_toolchain_mipsel_unknown_linux_musl, "~> 0.7.0"}]
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
       "external.mk", "package", "post-createfs.sh", "fwup.conf", "linux-4.4",
       "busybox.config", "linux-backports.defconfig"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/nerves_system_linkit"}]
  end
end
