use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

config :nerves_system_linkit, :nerves_env,
  type: :system,
  version: version,
  artifacts: [
    "https://github.com/nerves-project/nerves_system_linkit/releases/download/v#{version}/nerves_system_linkit-v#{version}.tar.gz",
    "https://s3.amazonaws.com/nerves/artifacts/nerves_system_linkit-#{version}.tar.gz"],
  platform: Nerves.System.BR,
  platform_config: [
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
