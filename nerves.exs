use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

config :nerves_system_linkit, :nerves_env,
  type: :system,
  version: version,
  mirrors: [
    "https://github.com/nerves-project/nerves_system_linkit/releases/download/v#{version}/nerves_system_linkit-v#{version}.tar.gz"],
  build_platform: Nerves.System.Platforms.BR,
  build_config: [
    defconfig: "nerves_defconfig",
    package_files: [
      "Config.in",
      "external.mk",
      "package",
      "rootfs-additions",
      "post-createfs.sh",
      "fwup.conf",
      "linux-3.18.29"
    ]
  ]
